import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookSortWidget extends HookConsumerWidget {
  final SortType sort;
  // 引数で関数を受け取り、選択肢が変更されたら呼び出す。
  final Function(SortType) onSortChanged;

  const HookSortWidget(
      {super.key, required this.sort, required this.onSortChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // sortTypeMapで定義した選択肢をドロップダウンで表示。
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      const Text('並び順: '),
      DropdownButton(
          items: [
            ...sortTypeMap.entries.map((e) => DropdownMenuItem(
                  value: e.key,
                  child: Text(e.value),
                )),
          ],
          value: sort, // ①が管理しているソート条件のstate
          // ソート条件が選択されたら①から受け取ったonSortChanged()を呼び出して①側のstateを更新する。
          onChanged: (value) => onSortChanged(value as SortType)),
    ]);
  }
}
