class GameConsole {
  final String name;
  final int price;
  GameConsole(this.name, this.price);
}

final gameConsoleList = [
  GameConsole('PS5', 54980),
  GameConsole('Xbox', 34800),
  GameConsole('Nintendo Switch', 37980),
  GameConsole('セガサターン', 44800),
  GameConsole('PSP', 19800),
  GameConsole('PSVITA', 24980),
  GameConsole('Dreamcast', 29800),
  GameConsole('Nintendo 3DS', 25000),
];

// ほんとはエンハンスドenumを使うとスッキリ書けるが
// 本題ではないので普通のenum
enum PriceFilter {
  all,

  /// すべて
  under40000,

  /// 4万円以下
  under20000,

  /// 2万円以下
}

Map<PriceFilter, String> priceFilterMap = {
  PriceFilter.all: 'すべて',
  PriceFilter.under40000: '4万円未満の商品',
  PriceFilter.under20000: '2万円未満の商品',
};

enum SortType {
  asc,
  desc,
}

Map<SortType, String> sortTypeMap = {
  SortType.asc: '価格が安い順',
  SortType.desc: '価格が高い順',
};

/// 価格フィルターを適用したリストを返す
List<GameConsole> getPriceFilteredList(
    List<GameConsole> list, PriceFilter filter) {
  return list.where((e) {
    if (filter == PriceFilter.all) {
      return true;
    } else if (filter == PriceFilter.under40000) {
      return e.price < 40000;
    } else if (filter == PriceFilter.under20000) {
      return e.price < 20000;
    } else {
      return false;
    }
  }).toList();
}

/// SortTypeで指定した条件でlistをソートして返す
List<GameConsole> getSortedList(List<GameConsole> list, SortType sort) {
  list.sort((a, b) {
    if (sort == SortType.asc) {
      return a.price - b.price;
    } else if (sort == SortType.desc) {
      return b.price - a.price;
    } else {
      return 0;
    }
  });
  return list;
}
