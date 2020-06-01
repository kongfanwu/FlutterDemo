import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './page/SDMMMessage.dart';
import './page/SDMMAI.dart';
import './page/SDMMWork.dart';
import 'page/apply/SDMMApply.dart';
import 'page/Mine/SDMMMine.dart';
import 'package:flui/flui.dart';
import 'package:flutter/rendering.dart'; // 可视化视图调试库
import './page/login.dart';
import 'package:sdmm/model/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _userModel = UserModel(null, null, null, null, null, null, null, false);
  FLToastDefaults _toastDefaults = FLToastDefaults();

  @override
  Widget build(BuildContext context) {
//    debugPaintSizeEnabled = true;// 可视方式调试布局问题
    // 如果你在 Provider 中提供了可监听对象（Listenable 或者 Stream）及其子类的话，那么你会得到下面这个异常警告。你可以将本文中所使用到的 CounterModel 放入 Provider 进行提供（记得 hot restart 而不是 hot reload），那么你就能看到上面这个 FlutterError 了。 你也可以在 main 方法中通过下面这行代码来禁用此提示。
//    Provider.debugCheckInvalidValueType = null;

    return FLToastProvider( // 包裹吐司提示
      child: MultiProvider( // 状态共享管理
        providers: [
//            ChangeNotifierProvider(create: (_) => _userModel), // 共享的对象
          ChangeNotifierProvider.value(value: _userModel),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.red,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _title = '';
  int _currentIndex = 3;
  List <BottomNavigationBarItem> _barItems;

  List <String> _titles = [
    '消息',
    'AI灯神',
    '会工作',
    '应用',
    '我的',
  ];

  List pages = [
    SDMMMessage(),
    SDMMAI(),
    SDMMWork(),
    SDMMApply(),
    SDMMMine(),
  ];

  @override
  void initState() {
    super.initState();
    _barItems = [
      BottomNavigationBarItem(title: Text(_titles[0]), icon: Icon(Icons.message)),
      BottomNavigationBarItem(title: Text(_titles[1]), icon: Icon(Icons.brightness_4)),
      BottomNavigationBarItem(title: Text(_titles[2]), icon: Icon(Icons.work)),
      BottomNavigationBarItem(title: Text(_titles[3]), icon: Icon(Icons.apps)),
      BottomNavigationBarItem(title: Text(_titles[4]), icon: Icon(Icons.person)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final userModel = context.watch<UserModel>();
    return !userModel.isLogin ? Login() : Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _barItems,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
            _title = _titles[_currentIndex];
          });
        },
      ),
    );
  }
}


