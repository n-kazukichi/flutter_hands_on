import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/items.dart';
import 'package:flutter_hands_on/pages/item_list/provider_sample/provider_price_filter.dart';
import 'package:flutter_hands_on/pages/item_list/provider_sample/provider_sort.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final itemListProvider = Provider((ref) {
  // ②の価格帯のstateをここでも監視して取得。
  final filter = ref.watch(priceFilterStateProvider);
  // ③のソート条件のstateをここでも監視して取得。
  final sort = ref.watch(sortTypeStateProvider);

  // ↑のstateを使って商品リストを絞り込み、並び替える。
  var list = getPriceFilteredList(gameConsoleList, filter);
  list = getSortedList(list, sort);
  return list;
});

class ProviderItemListWidget extends HookConsumerWidget {
  const ProviderItemListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // itemListProviderを監視し、絞り込み、並び替え済みの商品リストを取得。
    final list = ref.watch(itemListProvider);
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
