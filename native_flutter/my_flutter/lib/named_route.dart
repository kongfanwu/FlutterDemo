// 命名路由

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppNameRoute extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: HomeScreen(), // 与  initialRoute 冲突，只能实现一个
//       initialRoute: '/', // 默认启用的路由
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
//        ThreeScreen.threeRouterName: (context) => ThreeScreen(), // 在 onGenerateRoute 也可以注册，但是这里注册 onGenerateRoute 就不走了。
      },
      // 除了直接从组件里提取参数，你也可以通过 onGenerateRoute() 函数提取参数，然后把参数传递给组件。
      //onGenerateRoute() 函数会基于给定的 RouteSettings 来创建正确的路由。
      onGenerateRoute: (RouteSettings settings) {
        print('settings = $settings');
        if (settings.name == ThreeScreen.threeRouterName) {
          final String args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return ThreeScreen(
                name: args,
              );
            },
          );
        }
        return null;
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  var _batteryLevel = '0';

  @override
  void initState() {
    // TODO: implement initState
    // void setMethodCallHandler(Future<dynamic> handler(MethodCall call)) {
    // platform.setMethodCallHandler((call) => methodCall);
    platform.setMethodCallHandler((call) => methodCall(call));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Launch screen'),
              onPressed: () {
                // Navigate to the second screen when tapped.
                // 使用命名路由跳转到第二个界面（Navigate to the second screen using a named route）
                Navigator.pushNamed(context, '/second');
              },
            ),
            RaisedButton(
              child: Text(_batteryLevel),
              onPressed: () {
                _getBatteryLevel();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      // 调用原生方法， 并传参数
      final int result =
      await platform.invokeMethod('getBatteryLevel', <String, dynamic>{
        'song': 'songid',
        'volume': 'volumeid',
      });
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future methodCall(MethodCall call) async {
    print(call.arguments);
    if ('getUserId' == call.method) {
      var dic = <String, dynamic>{'age': '20'};
      return dic;
    }
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                // Navigate back to first screen when tapped.
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigate back to first screen when tapped.
                Navigator.pushNamed(context, ThreeScreen.threeRouterName,
                    arguments: 'kongfanwu');
              },
              child: Text('push ThreeScreen'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThreeScreen extends StatelessWidget {
  // 定义路由名称 常量
  static const threeRouterName = '/three';
  ThreeScreen({this.name});
  final name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                SystemNavigator.pop(animated: true);
              },
              child: Text('退出Flutter VC'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Go to FirstScreen!'),
            ),
          ],
        ),
      ),
    );
  }
}
