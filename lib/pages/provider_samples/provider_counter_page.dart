import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  // stateの初期値を指定する。
  CounterNotifier(int initialValue) : super(initialValue);
  // ビジネスロジック
  void increment() {
    state++;
  }
}

final counterProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier(0));

/*
// 初期値指定可能なStateProvider
final counterProvider =
    AutoDisposeStateNotifierProviderFamily<CounterNotifier, int, int>(
        (ref, initialValue) {
  return CounterNotifier(initialValue);
});
*/

class ProviderCounterPage extends HookConsumerWidget {
  const ProviderCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    // 初期値の指定がある場合はこちら。
    // const initial = 150;
    // final counter = ref.watch(counterProvider(initial));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Providerでのカウンター'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'counter',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // (+)ボタンを押したらstateの値を+1してますよ。
        onPressed: () => ref.read(counterProvider.notifier).increment(),
// 初期値指定ありの場合コチラ
//        onPressed: () => ref.read(counterProvider(initial).notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
