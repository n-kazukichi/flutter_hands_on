import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

// ユーザのログイン状態を把握するプロバイダ。
final userStreamProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class FirebasePage extends HookConsumerWidget {
  const FirebasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ユーザのログイン状態を監視する。
    final user = ref.watch(userStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FirebaseAuth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 監視しているログイン状態が...
            ...user.when(loading: () {
              // ログイン済み？未ログイン？かを通信して確かめている状態。
              return [const CircularProgressIndicator()];
            }, data: (user) {
              // ログイン済みかどうかがわかった。
              if (user == null) {
                // user が null すなわちログインしていないのでログインボタン表示。
                return [
                  ElevatedButton(
                    child: const Text("Googleログイン"),
                    onPressed: () async => await signInWithGoogle(),
                  )
                ];
              } else {
                // user が null ではないので、googleアカウントに指定されている
                // アイコンと名前、ログアウトボタン表示。
                return [
                  CircleAvatar(foregroundImage: NetworkImage(user.photoURL!)),
                  Text(user.displayName!),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text("ログアウト"),
                    onPressed: () async => await signOut(),
                  )
                ];
              }
            }, error: (e, t) {
              // ユーザの監視中に何らかのエラーが発生。
              return [const Text("エラー")];
            })
          ],
        ),
      ),
    );
  }
}

// ログアウト
Future<void> signOut() async => await FirebaseAuth.instance.signOut();
// Googleログイン
Future<void> signInWithGoogle() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  if (kIsWeb) {
    // web版
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      await auth.signInWithRedirect(authProvider);
    } catch (e) {
      rethrow;
    }
  } else {
    // モバイル
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount == null) {
      throw Exception("googleSignInAccount 取得失敗");
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
      } else if (e.code == 'invalid-credential') {}
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
