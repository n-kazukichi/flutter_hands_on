import 'package:flutter/material.dart';
import 'package:flutter_hands_on/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemListMenu extends HookConsumerWidget {
  const ItemListMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品リスト サンプルのメニュー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoutePath.hookItemList),
                child: const Text('フック版')),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoutePath.providerItemList),
                child: const Text('プロバイダ版'))
          ],
        ),
      ),
    );
  }
}
