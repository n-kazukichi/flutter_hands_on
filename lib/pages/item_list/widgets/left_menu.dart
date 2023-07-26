import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 左メニュー用。コンテンツ部分を受け取り、区切り線を追加して表示。
class LeftMenu extends HookConsumerWidget {
  final Widget child;
  const LeftMenu({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(color: Colors.blue),
          ),
        ),
        child: child);
  }
}
