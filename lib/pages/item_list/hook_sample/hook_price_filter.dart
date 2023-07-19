import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookPriceFulterWidget extends HookConsumerWidget {
  final PriceFilter filter;
  // 引数で関数を受け取り、選択肢が変更されたら呼び出す。
  final Function(PriceFilter) onFilterChanged;
  const HookPriceFulterWidget(
      {super.key, required this.filter, required this.onFilterChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // priceFilterMapで定義した選択肢をラジオボタンで表示。
    return Column(children: [
      ...priceFilterMap.entries.map((e) {
        return RadioListTile(
          value: e.key,
          groupValue: filter, // ①が管理している価格帯情報のstate
          // 選択されたら①から受け取ったonFilterChanged()を呼び出して①側のstateを更新する。
          onChanged: (value) => onFilterChanged(value as PriceFilter),
          title: Text(e.value),
        );
      }),
    ]);
  }
}
