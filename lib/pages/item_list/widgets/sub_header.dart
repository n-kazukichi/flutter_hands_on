import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// サブヘッダー用。コンテンツ部分を受け取り、区切り線を追加して表示。
class SubHeader extends HookConsumerWidget {
  final Widget child;
  const SubHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.blue),
          ),
        ),
        child: child);
  }
}
