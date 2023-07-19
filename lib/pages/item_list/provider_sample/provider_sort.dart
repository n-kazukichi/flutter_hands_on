import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/item_list/items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ソート条件の初期値は価格が安い順。sortTypeStateProviderとしてこのstateを配信。
final sortTypeStateProvider = StateProvider((ref) => SortType.asc);

class ProviderSortWidget extends HookConsumerWidget {
  const ProviderSortWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ソート条件のstateを監視し...
    final sort = ref.watch(sortTypeStateProvider);
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      const Text('並び順: '),
      DropdownButton(
          items: [
            ...sortTypeMap.entries.map((e) => DropdownMenuItem(
                  value: e.key,
                  child: Text(e.value),
                )),
          ],
          value: sort,
          // ソート条件が選択されたらstateをstateを更新する。
          onChanged: (value) =>
              ref.read(sortTypeStateProvider.notifier).state = value!),
    ]);
  }
}
