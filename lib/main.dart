import 'package:flutter/material.dart';
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

class MyHooksPage extends HookConsumerWidget {
  const MyHooksPage(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useStateでcounterを管理していますよ。
    final counter = useState(0);
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
        onPressed: () => counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// // MyHomePageはStatefulWidget(なんらかのStateを持っているWidget)で...
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   // そのStateとWidgetの実態は_MyHomePageStateです。
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// // _MyHomePageStateは、↑のMyHomePageと紐づくStateを持っていて...
// class _MyHomePageState extends State<MyHomePage> {
//   // Stateはこの_counterですよ。
//   int _counter = 0;

//   // _counterというStateを書き換えるメソッド。
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   // そのStateにまつわるWidgetはここで組み立てます。
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       // 画面右下のボタンを押すと_incrementCounterが呼ばれStateが書き換わる。
//       // すると、build()が呼ばれて画面が再描画される。
//       // その時 _counter の値が変わっているので、それが反映される。
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }