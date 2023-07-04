import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_counter_page.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_fetch_user_page.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_samples_menu_page.dart';
import 'package:flutter_hands_on/pages/provider_samples/provider_counter_page.dart';
import 'package:flutter_hands_on/pages/provider_samples/provider_fetch_user_page.dart';
import 'package:flutter_hands_on/pages/provider_samples/provider_samples_menu_page.dart';

class RoutePath {
  /// フックを使ったサンプルのメニュー画面
  static const hookSamplesMenu = '/hook_menu';

  /// フックを使ったカウンター画面
  static const hookSamplesCounter = '$hookSamplesMenu/counter';

  /// フックを使ったカウンターユーザ取得画面
  static const hookSamplesFetchUser = '$hookSamplesMenu/fetch';

  /// プロバイダを使ったサンプルのメニュー画面
  static const providerSamplesMenu = '/provider_menu';

  /// プロバイダを使ったカウンター画面
  static const providerSamplesCounter = '$providerSamplesMenu/counter';

  /// プロバイダを使ったカウンターユーザ取得画面
  static const providerSamplesFetchUser = '$providerSamplesMenu/fetch';
  // 新しい画面が追加されたらここにpathを追加
}

final Map<String, WidgetBuilder> routeMap = {
  RoutePath.hookSamplesMenu: (context) => const HookSamplesMenuPage(),
  RoutePath.hookSamplesCounter: (context) => const HookCounterPage(),
  RoutePath.hookSamplesFetchUser: (context) => const HookFetchUserPage(),

  RoutePath.providerSamplesMenu: (context) => const ProviderSamplesMenuPage(),
  RoutePath.providerSamplesCounter: (context) => const ProviderCounterPage(),
  RoutePath.providerSamplesFetchUser: (context) =>
      const ProviderFetchUserPage(),

  // 新しい画面が追加されたらここにpathとそれに該当する画面を追加
};
