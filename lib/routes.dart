import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_counter_page.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_fetch_user_page.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_samples_menu_page.dart';

class RoutePath {
  /// フックを使ったサンプルのメニュー画面
  static const hookSamplesMenu = '/hook_menu';

  /// フックを使ったカウンター画面
  static const hookSamplesCounter = '$hookSamplesMenu/counter';

  /// フックを使ったカウンターユーザ取得画面
  static const hookSamplesFetchUser = '$hookSamplesMenu/fetch';
  // 新しい画面が追加されたらここにpathを追加
}

final Map<String, WidgetBuilder> routeMap = {
  RoutePath.hookSamplesMenu: (context) => const HookSamplesMenuPage(),
  RoutePath.hookSamplesCounter: (context) => const HookCounterPage(),
  RoutePath.hookSamplesFetchUser: (context) => const HookFetchUserPage(),
  // 新しい画面が追加されたらここにpathとそれに該当する画面を追加
};
