import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
//        home: ChangeNotifierProvider<User>.value(
//          value: User('kong', 10),
//          child: MyHomePage(title: 'Peovider Demo'),
//        ),

//        Provider<String>.value(
//            value: 'FirstPage Provider11',
//            child: MyHomePage(title: 'Peovider Demo')
//        )
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => User('user', 10)),
          ChangeNotifierProvider(create: (_) => Dog('dog', 1)),
          ChangeNotifierProvider(create: (_) => User('user2', 10)),
        ],
        child: MyHomePage(title: 'Peovider Demo'),
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
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    void onTap() {
      print('print');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text('${Provider.of<User>(context, listen: true).name}'), // 监听方式二
          Text('${context.watch<Dog>().name}'), // 监听方式一
          Text('${Provider.of<User>(context, listen: true).name}'), // 监听方式二
          FlatButton(
            onPressed: (){
//              final user = Provider.of<User>(context, listen: false);
              final user = context.read<User>();
              _counter++;
              user.setName("1_${_counter}");
            },
            child: Text('button'),
          ),
        ],
      ),
    );
  }
}

// User 实体 Bean
class User with ChangeNotifier {
  var name;
  var age;
  User(this.name, this.age);

  void setName(String name) {
    this.name = name;
    notifyListeners(); // 通知 provider 更新
  }

  String get getName => this.name;
}

// User 实体 Bean
class Dog with ChangeNotifier {
  var name;
  var age;
  Dog(this.name, this.age);

  void setName(String name) {
    this.name = name;
    notifyListeners(); // 通知 provider 更新
  }

  String get getName => this.name;
}