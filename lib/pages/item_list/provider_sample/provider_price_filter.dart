import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 価格帯の初期値は「すべて」。priceFilterStateProviderとしてこのstateを配信。
final priceFilterStateProvider = StateProvider((ref) => PriceFilter.all);

class ProviderPriceFulterWidget extends HookConsumerWidget {
  const ProviderPriceFulterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 価格帯のstateを監視し...
    final filter = ref.watch(priceFilterStateProvider);
    return Column(children: [
      ...priceFilterMap.entries.map((e) {
        return RadioListTile(
          value: e.key,
          groupValue: filter,
          // 価格帯が選択されたらstateを更新する。
          onChanged: (value) =>
              ref.read(priceFilterStateProvider.notifier).state = value!,
          title: Text(e.value),
        );
      }),
    ]);
  }
}
