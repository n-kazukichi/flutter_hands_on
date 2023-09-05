import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/firebase_auth/firebase_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ユーザのログイン状態を把握するプロバイダ。
final userStreamProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class FirestoreProfileEditPage extends HookConsumerWidget {
  const FirestoreProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ユーザのログイン状態を監視する。
    final user = ref.watch(userStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestoreサンプル プロフ編集画面'),
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
                return [const CircularProgressIndicator()];
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

/// ログインボタンだけを表示する部品。
class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text("Googleログイン"),
        onPressed: () async => await signInWithGoogle());
  }
}
