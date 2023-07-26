import 'package:flutter_hands_on/services/api_fetch_user.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 引数で指定されたユーザIDのユーザ名を返す
String useUserName(int userId) {
  final userName = useState('');
  // ReactのuseContextとは全く違うもの。
  final context = useContext();

  useEffect(() {
    void fetch() async {
      final name = await fetchUserName(userId);
      if (context.mounted) {
        userName.value = name;
      }
    }

    fetch();
    return null;
  }, [userId]);

  return userName.value;
}
