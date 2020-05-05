import 'package:flutter/material.dart';
import './page/SDMMMessage.dart';
import './page/SDMMAI.dart';
import './page/SDMMWork.dart';
import './page/SDMMApply.dart';
import 'page/Mine/SDMMMine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _currentIndex = 4;
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
