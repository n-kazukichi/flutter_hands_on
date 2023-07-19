import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/provider_sample/provider_item_list.dart';
import 'package:flutter_hands_on/pages/item_list/provider_sample/provider_price_filter.dart';
import 'package:flutter_hands_on/pages/item_list/provider_sample/provider_sort.dart';
import 'package:flutter_hands_on/pages/item_list/widgets/left_menu.dart';
import 'package:flutter_hands_on/pages/item_list/widgets/sub_header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderItemListPage extends HookConsumerWidget {
  const ProviderItemListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('プロバイダによる商品リスト'),
        ),
        body: Row(
          children: [
            const Flexible(
                flex: 2, child: LeftMenu(child: ProviderPriceFulterWidget())),
            Flexible(
                flex: 3,
                child: Column(children: const [
                  SubHeader(child: ProviderSortWidget()),
                  Flexible(child: ProviderItemListWidget()),
                ]))
          ],
        ));
  }
}
