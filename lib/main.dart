import 'package:flutter/material.dart';
import 'package:flutter_hands_on/hooks/use_counter.dart';
import 'package:flutter_hands_on/pages/second_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// エントリポイント
void main() {
  // MyAppクラスをnewする。
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Reactで言うところのJSX部分。
  Widget build(BuildContext context) {
    // マテリアルデザインのテーマで...
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 初期画面にMyHomePageを指定。
      home: const MyHooksPage('Flutter Demo Home Page With Hooks'),
    );
  }
}

ValueNotifier<T> useLoggedState<T>(T initialData) {
  final result = useState<T>(initialData);

  useValueChanged<T, void>(result.value, (_, __) {
    print(result.value);
  });
  return result;
}

class MyHooksPage extends HookConsumerWidget {
  const MyHooksPage(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = useLoggedState(0);
    final counter = useCounter(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
            ElevatedButton(
                onPressed: () {
                  // ボタンを押したらSecondPageに遷移するよ。
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: const Text('次の画面へ'))
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
