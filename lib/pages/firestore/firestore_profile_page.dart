import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/firebase_auth/firebase_page.dart';
import 'package:flutter_hands_on/pages/firestore/firestore_login_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirestoreProfilePage extends HookConsumerWidget {
  const FirestoreProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ユーザのログイン状態を監視する。
    final user = ref.watch(appUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestoreサンプル プロフ画面'),
        automaticallyImplyLeading: false,
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
                  const Text('未ログインです。ログインからやり直してください。'),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    child: const Text('戻る'),
                    onPressed: () => Navigator.pop(context),
                  )
                ];
              } else {
                return [
                  CircleAvatar(foregroundImage: NetworkImage(user['avater'])),
                  Text(user['name']),
                  Text('所在地:${user["locale"]}'),
                  Text('自己紹介:${user["description"]}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      child: const Text("ログアウト"),
                      onPressed: () async {
                        await signOut();
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      })
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
