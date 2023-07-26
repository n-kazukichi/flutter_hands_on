import 'package:flutter/material.dart';
import 'package:flutter_hands_on/services/api_fetch_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ドロップダウンの初期値はユーザIDが0番目==ユーザIDが0とする。
final dropDownStateProvider = StateProvider<int>((ref) => 0);

// 擬似的な通信処理でユーザ名を取得する。
final userNameProvider = FutureProvider<String>((ref) async {
  // こちらのproviderでも、dropDownStateProviderを監視する事ができる。
  // この場合、プルダウンが操作されることでdropDownStateProviderの値が変更される。
  // それをトリガに、もう一度ユーザ名を取得しに行ってくれる。
  final uid = ref.watch(dropDownStateProvider);
  final name = await fetchUserName(uid);
  return name;
});

class ProviderFetchUserPage extends HookConsumerWidget {
  const ProviderFetchUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(dropDownStateProvider);
    final userName = ref.watch(userNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('providerでのユーザ名取得'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userName.when(
                // ユーザ名を取得中にエラーが発生した場合。
                error: (err, _) => Text(err.toString()),
                // まだ通信中の状態の場合。
                loading: () => const Text('通信中...'),
                // 実際にユーザ名が取得できた場合。
                data: (data) => Text('ユーザ名:$data')),
            const SizedBox(
              height: 64,
            ),
            DropdownButton(
                items: [
                  ...[0, 1, 2].map((e) => DropdownMenuItem(
                        value: e,
                        child: Text('ID $eの人を表示'),
                      )),
                ],
                value: uid,
                onChanged: (value) =>
                    ref.read(dropDownStateProvider.notifier).state = value!),
          ],
        ),
      ),
    );
  }
}
