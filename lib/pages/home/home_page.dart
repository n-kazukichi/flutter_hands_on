import 'package:flutter/material.dart';
import 'package:flutter_hands_on/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoutePath.hookSamplesMenu),
                child: const Text('Hookのサンプルメニューへ')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, RoutePath.providerSamplesMenu),
                child: const Text('providerのサンプルメニューへ'))
          ],
        ),
      ),
    );
  }
}
