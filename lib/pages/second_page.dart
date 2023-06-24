import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondPage extends HookConsumerWidget {
  SecondPage({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultUid = 0;
    final uid = useState(defaultUid);
    final updateCounter = useState(0);
    final userName = useState('');

    // useEffect(A)
    useEffect(() {
      debugPrint('useEffect(A) mount時のみのuseEffect');
      return () => debugPrint('useEffect(A) のdispose()');
    }, []);

    // useEffect(B)
    useEffect(() {
      debugPrint('useEffect(B) 毎回呼ばれるuseEffect${DateTime.now()}');
      return () => debugPrint('useEffect(B) のdispose()');
    });

    // useEffect(C)
    useEffect(() {
      debugPrint('useEffect(C) ユーザIDが変わると呼ばれるuseEffect');

      // ユーザの入力に応じて通信を行い情報を引いてくるなど。
      void fetchUserName() async {
        final name = await _fetchUserName(uid.value);
        userName.value = name;
      }

      fetchUserName();

      return () => debugPrint('useEffect その3 のdispose()');
    }, [uid.value]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("2nd Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ユーザ名:${userName.value}',
            ),
            const SizedBox(
              height: 64,
            ),
            DropdownButton(items: [
              ..._dataMap.keys.map((e) => DropdownMenuItem(
                    value: e,
                    child: Text('ID $eの人を表示'),
                  )),
            ], value: uid.value, onChanged: (value) => uid.value = value!),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
                onPressed: () {
                  updateCounter.value++;
                },
                child: Text('画面更新 ${updateCounter.value}回目')),
          ],
        ),
      ),
    );
  }
}
