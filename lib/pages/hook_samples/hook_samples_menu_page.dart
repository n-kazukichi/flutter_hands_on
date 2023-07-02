import 'package:flutter/material.dart';
import 'package:flutter_hands_on/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookSamplesMenuPage extends HookConsumerWidget {
  const HookSamplesMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hookサンプルのメニュー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, hookSamplesCounter),
                child: const Text('カウンター')),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, hookSamplesFetchUser),
                child: const Text('ユーザ取得'))
          ],
        ),
      ),
    );
  }
}
