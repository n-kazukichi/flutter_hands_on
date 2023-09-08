import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/firestore/firestore_login_page.dart';
import 'package:flutter_hands_on/pages/firestore/firestore_profile_edit_page.dart';
import 'package:flutter_hands_on/pages/firestore/firestore_profile_page.dart';
import 'package:flutter_hands_on/pages/generated_provider/counter_page.dart';
import 'package:flutter_hands_on/pages/generated_provider/generated_provider_menu_page.dart';
import 'package:flutter_hands_on/pages/firebase_auth/firebase_page.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_counter_page.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_fetch_user_page.dart';
import 'package:flutter_hands_on/pages/hook_samples/hook_samples_menu_page.dart';
import 'package:flutter_hands_on/pages/item_list/hook_sample/hook_item_list_page.dart';
import 'package:flutter_hands_on/pages/item_list/item_list_menu_page.dart';
import 'package:flutter_hands_on/pages/item_list/provider_sample/provider_item_list_page.dart';
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

  /// 商品リストっぽいサンプルのメニュー画面
  static const itemListSampleMenu = '/item_list_menu_page';

  /// フックを使った商品リスト
  static const hookItemList = '$itemListSampleMenu/hook';

  /// プロバイダを使った商品リスト
  static const providerItemList = '$itemListSampleMenu/provider';

  /// providerの自動生成サンプルのメニュー画面
  static const generateProviderSampleMenu = '/gen_provider_menu_page';

  /// providerの自動生成によるカウンター
  static const generateProviderCounter = '$generateProviderSampleMenu/counter';

  /// providerの自動生成によるTodoリスト
//  static const generateProviderTodo = '$itemListSampleMenu/todo';

  /// Firebaseのサンプル
  static const firebaseSample = '/firebase';
  // Firestoreのサンプル
  static const firestoreSample = '/firestore';
  static const firestoreSampleLogin = '$firestoreSample/login';
  static const firestoreSampleProfile = '$firestoreSample/profile';
  static const firestoreSampleProfileEdit = '$firestoreSample/profile/edit';

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

  RoutePath.itemListSampleMenu: (context) => const ItemListMenu(),
  RoutePath.hookItemList: (context) => const HookItemListPage(),
  RoutePath.providerItemList: (context) => const ProviderItemListPage(),

  RoutePath.generateProviderSampleMenu: (context) =>
      const GeneratedProviderMenuPage(),
  RoutePath.generateProviderCounter: (context) => const CounterPage(),
//  RoutePath.generateProviderTodo: (context) => const CounterPage(),
  RoutePath.firebaseSample: (context) => const FirebasePage(),

  RoutePath.firestoreSampleLogin: (context) => const FirestoreLoginPage(),
  RoutePath.firestoreSampleProfile: (context) => const FirestoreProfilePage(),
  RoutePath.firestoreSampleProfileEdit: (context) =>
      const FirestoreProfileEditPage(),

  // 新しい画面が追加されたらここにpathとそれに該当する画面を追加
};
