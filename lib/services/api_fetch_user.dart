final Map<int, String> _dataMap = {
  0: '山田太郎',
  1: '鈴木一郎',
  2: '佐藤花子',
};

Future<String> fetchUserName(int uid) async {
  // 擬似API通信。1秒後に何らかの氏名を返す。
  await Future.delayed(const Duration(seconds: 1));
  return _dataMap[uid] ?? '名無し';
}
