import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/firebase_auth/firebase_page.dart';
import 'package:flutter_hands_on/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// FirebaseAuthにログイン状態であるか?を取得するプロバイダ。
final _firebaseAuthUserProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

/// FirebaseAuthのuidでFirestoreからユーザ情報を検索する。
Future<Map<String, dynamic>?> findUser(String uid) async {
  final db = FirebaseFirestore.instance;
  final doc = await db.collection('users').doc(uid).get();
  return doc.data();
}

/// FirebaseAuthで取得できる情報にアプリで独自に管理したい情報を加えて新規ユーザを登録します。
Future<Map<String, dynamic>?> createNewUser(User firebaseUser) async {
  final db = FirebaseFirestore.instance;
  // `usersコレクション に uidをドキュメントID にする旨を設定。
  final ref = db.collection('users').doc(firebaseUser.uid);

  // 必要な情報を登録。
  await ref.set({
    'name': firebaseUser.displayName, // 名前
    'avater': firebaseUser.photoURL, // 画像
    'locale': '日本', // 所在地
    'description': 'まだありません' // 自己紹介
  });

  // 登録した情報を改めて取得して返却。
  final newUser = await ref.get();
  return newUser.data();
}

/// FirebaseAuthのログイン情報をもとに、アプリのユーザ情報をFirestoreから取得するプロバイダ。
final appUserProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  // FirebaseAuthにログインしているか？を監視。
  final user = ref.watch(_firebaseAuthUserProvider.future);
  final firebaseUser = await user;

  // ログインしていない or ログアウトした直後
  if (firebaseUser == null) {
    // ログインしていない旨のnullを返却。
    return null;
  }

  // FirebaseAuthで取得したuidをもとに、Firestoreからユーザ情報を探す。
  final theUser = await findUser(firebaseUser.uid);
  if (theUser != null) {
    // 登録済みのユーザが見つかったので、その情報を返却。
    return theUser;
  }
  // ユーザが見つからなかった。すなわち新規ユーザなのでユーザ作成の後に作成した情報を返却。
  final newUser = await createNewUser(firebaseUser);
  return newUser;
});

class FirestoreLoginPage extends HookConsumerWidget {
  const FirestoreLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // アプリのユーザ情報を監視し...
    final user = ref.watch(appUserProvider);
    if (user.hasValue && user.value != null) {
      // 何らかの結果を得られた && user情報がnullでなければログイン済みとみなせる。
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // プロフ表示画面へ遷移。
        Navigator.pushNamed(context, RoutePath.firestoreSampleProfile);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestoreサンプル ログイン画面'),
      ),
      body: Center(
          child: user.when(loading: () {
        // まだユーザ情報があるかどうかの通信中...クルクル表示。
        return const CircularProgressIndicator();
      }, data: (user) {
        if (user == null) {
          // ユーザ情報を取得したが、それがnull. すなわち未ログインなのでログインボタン表示。
          return ElevatedButton(
            child: const Text('Googleログイン'),
            onPressed: () async => await signInWithGoogle(),
          );
        } else {
          // ログイン済みの場合はプロフ画面に自動的に遷移するため、何も描画しなくてよい。
          return null;
        }
      }, error: (e, t) {
        return const Text('エラー');
      })),
    );
  }
}
