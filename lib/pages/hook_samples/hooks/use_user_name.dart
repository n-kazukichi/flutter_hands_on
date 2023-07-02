import 'package:flutter_hooks/flutter_hooks.dart';

final Map<int, String> _dataMap = {
  0: '山田太郎',
  1: '鈴木一郎',
  2: '佐藤花子',
};

Future<String> _fetchUserName(int uid) async {
  // 擬似API通信。1秒後に何らかの氏名を返す。
  await Future.delayed(const Duration(seconds: 1));
  return _dataMap[uid] ?? '名無し';
}

/// 引数で指定されたユーザIDのユーザ名を返す
String useUserName(int userId) {
  final userName = useState('');
  // ReactのuseContextとは全く違うもの。
  final context = useContext();

  useEffect(() {
    void fetchUserName() async {
      final name = await _fetchUserName(userId);
      if (context.mounted) {
        userName.value = name;
      }
    }

    fetchUserName();
    return null;
  }, [userId]);

  return userName.value;
}
