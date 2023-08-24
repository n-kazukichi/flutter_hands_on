import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class FirebasePage extends HookConsumerWidget {
  const FirebasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // 初期値の指定がある場合はこちら。
    // const initial = 150;
    // final counter = ref.watch(counterProvider(initial));

    return Scaffold(
      appBar: AppBar(
        title: const Text('ふぁいやーべーす'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'counter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // (+)ボタンを押したらstateの値を+1してますよ。
        onPressed: () => print("osita"),
// 初期値指定ありの場合コチラ
//        onPressed: () => ref.read(counterProvider(initial).notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
