import 'package:flutter/material.dart';
import 'package:flutter_hands_on/hooks/use_user_name.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookFetchUserPage extends HookConsumerWidget {
  const HookFetchUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultUid = 0;
    final uid = useState(defaultUid);
    final updateCounter = useState(0);
    final userName = useUserName(uid.value);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hookでのユーザ名取得'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ユーザ名:$userName',
            ),
            const SizedBox(
              height: 64,
            ),
            DropdownButton(items: [
              ...[0, 1, 2].map((e) => DropdownMenuItem(
                    value: e,
                    child: Text('ID $eの人を表示'),
                  )),
            ], value: uid.value, onChanged: (value) => uid.value = value!),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
                onPressed: () {
                  updateCounter.value++;
                },
                child: Text('画面更 新 ${updateCounter.value}回目')),
          ],
        ),
      ),
    );
  }
}
