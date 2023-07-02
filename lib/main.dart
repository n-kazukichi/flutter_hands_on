import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/home/home_page.dart';
import 'package:flutter_hands_on/routes.dart';

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
      routes: routeMap,
      // 初期画面にMyHomePageを指定。
      home: const HomePage(),
    );
  }
}
