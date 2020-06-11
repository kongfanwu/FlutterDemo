// 命名路由

import 'package:flutter/material.dart';

class MyAppNameRoute extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: HomeScreen(), // 与  initialRoute 冲突，只能实现一个
      initialRoute: '/', // 默认启用的路由
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
              return ThreeScreen(name: args,);
            },
          );
        }
        return null;
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen when tapped.
            // 使用命名路由跳转到第二个界面（Navigate to the second screen using a named route）
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
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
                Navigator.pushNamed(context, ThreeScreen.threeRouterName, arguments: 'kongfanwu');
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
        child: RaisedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Go to FirstScreen!'),
        ),
      ),
    );
  }
}