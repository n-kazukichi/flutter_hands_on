import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookItemListWidget extends HookConsumerWidget {
  // ①から受け取った商品リストを操作する条件。
  final PriceFilter filter;
  final SortType sort;
  const HookItemListWidget(
      {super.key, required this.filter, required this.sort});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 条件に応じて商品リストを絞り込み、並び替えてあげる。
    var list = getPriceFilteredList(gameConsoleList, filter);
    list = getSortedList(list, sort);

    return ListView(
        children: list
            .asMap()
            .entries
            .map((e) => ListTile(
                  tileColor: e.key % 2 == 0 ? Colors.blue[50] : null,
                  title: Text(e.value.name),
                  subtitle: Text(
                    e.value.price.toString(),
                    textAlign: TextAlign.end,
                  ),
                ))
            .toList());
  }
}
