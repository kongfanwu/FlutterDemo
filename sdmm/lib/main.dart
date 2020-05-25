import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './page/SDMMMessage.dart';
import './page/SDMMAI.dart';
import './page/SDMMWork.dart';
import './page/SDMMApply.dart';
import 'page/Mine/SDMMMine.dart';
import 'package:flui/flui.dart';
import 'package:flutter/rendering.dart'; // 可视化视图调试库
import './page/login.dart';
import 'package:sdmm/model/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    debugPaintSizeEnabled = true;// 可视方式调试布局问题

    final _userModel = UserModel(null, null, null, null, null, null, null, false);
    FLToastDefaults _toastDefaults = FLToastDefaults();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),
      home: FLToastProvider( // 包裹吐司提示
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => _userModel),
          ],
          child: !_userModel.isLogin ? Login() : MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
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
  int _currentIndex = 0;
  List pages = [
    SDMMMessage(),
    SDMMAI(),
    SDMMWork(),
    SDMMApply(),
    SDMMMine(),
  ];

  List <String> _titles = [
    '消息',
    'AI灯神',
    '会工作',
    '应用',
    '我的',
  ];

  @override
  Widget build(BuildContext context) {

    List <BottomNavigationBarItem> barItems = [
      BottomNavigationBarItem(title: Text(_titles[0]), icon: Icon(Icons.message)),
      BottomNavigationBarItem(title: Text(_titles[1]), icon: Icon(Icons.brightness_4)),
      BottomNavigationBarItem(title: Text(_titles[2]), icon: Icon(Icons.work)),
      BottomNavigationBarItem(title: Text(_titles[3]), icon: Icon(Icons.apps)),
      BottomNavigationBarItem(title: Text(_titles[4]), icon: Icon(Icons.person)),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: barItems,
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
