import 'package:flutter_hooks/flutter_hooks.dart';

class Counter {
  Counter(this.value, this.increment);
  final int value;
  final Function increment;
}

/// カウンターの値を保持する独自hook
/// 現在のカウントとカウントアップするビジネスロジックを内包したCounterクラスを返します。
Counter useCounter(int initialData) {
  // カウントを保持するstate
  final result = useState(initialData);

  // カウントアップするビジネスロジック
  void increment() {
    result.value++;
  }

  // Reactであれば [state, method] のような形で返し
  // 利用側では const [count, increment] = useCounter(0) のように受け取るが
  // そのようなことは言語仕様的にできないのでクラスに値とメソッドを詰めて返す。
  return Counter(result.value, increment);
}
