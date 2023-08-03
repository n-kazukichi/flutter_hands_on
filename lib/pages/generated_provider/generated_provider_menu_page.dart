import 'package:flutter/material.dart';
import 'package:flutter_hands_on/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GeneratedProviderMenuPage extends HookConsumerWidget {
  const GeneratedProviderMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自動生成したproviderサンプルのメニュー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                    context, RoutePath.generateProviderCounter),
                child: const Text('カウンター')),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
