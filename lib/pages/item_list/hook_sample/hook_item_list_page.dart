import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/hook_sample/hook_item_list.dart';
import 'package:flutter_hands_on/pages/item_list/hook_sample/hook_price_filter.dart';
import 'package:flutter_hands_on/pages/item_list/hook_sample/hook_sort.dart';
import 'package:flutter_hands_on/pages/item_list/items.dart';
import 'package:flutter_hands_on/pages/item_list/widgets/left_menu.dart';
import 'package:flutter_hands_on/pages/item_list/widgets/sub_header.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookItemListPage extends HookConsumerWidget {
  const HookItemListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 今まで②にあったラジオボタンのどれを選んでいるか？
    // を覚えておくstateをここに定義しつつ、変更をされた旨を受け取る関数を定義。
    final filter = useState(PriceFilter.all);
    void onFilterChanged(PriceFilter v) => filter.value = v;
    // 今まで③にあったドロップダウンでどれを選んでいるか？
    // を覚えておくstateをここに定義しつつ、変更をされた旨を受け取る関数を定義。
    final sort = useState(SortType.asc);
    void onSortChanged(SortType v) => sort.value = v;

    return Scaffold(
        appBar: AppBar(
          title: const Text('フックによる商品リスト'),
        ),
        body: Row(
          children: [
            Flexible(
                flex: 2,
                child: LeftMenu(
                  // 価格帯を選択するラジオボタンのstateと変更を受け取る関数を渡してあげる。
                  child: HookPriceFulterWidget(
                      filter: filter.value, onFilterChanged: onFilterChanged),
                )),
            Flexible(
                flex: 3,
                child: Column(children: [
                  // 並び順を選択するドロップダウンのstateと変更を受け取る関数を渡してあげる。
                  SubHeader(
                      child: HookSortWidget(
                          sort: sort.value, onSortChanged: onSortChanged)),
                  Flexible(
                      // ②と③のstate、つまり商品リストを操作する条件を渡してあげる。
                      child: HookItemListWidget(
                          filter: filter.value, sort: sort.value)),
                ]))
          ],
        ));
  }
}
