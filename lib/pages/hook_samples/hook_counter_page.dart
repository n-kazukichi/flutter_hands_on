import 'package:flutter/material.dart';
import 'package:flutter_hands_on/hooks/use_counter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookCounterPage extends HookConsumerWidget {
  const HookCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useCounter(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hookでのカウンター'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'counter',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // (+)ボタンを押したらstateの値を+1してますよ。
        onPressed: () => counter.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
