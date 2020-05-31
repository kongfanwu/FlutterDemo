import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {//1
  int _count;
  Counter(this._count);

  void add() {
    _count++;
    notifyListeners();//2
  }
  get count => _count;//3
}

class ProviderMyApp2 extends StatefulWidget {
  @override
  _ProviderMyApp2State createState() => _ProviderMyApp2State();
}

class _ProviderMyApp2State extends State<ProviderMyApp2> {
  @override
  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<Counter>.value(//1
//      notifier: Counter(1),//2
//      child: Container(child: Text('23456'),),
//    );

    return ChangeNotifierProvider.value(
      value: Counter(1),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton(
            child: Text("下一页"),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondPage();
                })),
          ),
        ],
      ),
      body: Center(
        child: Text("${Provider.of<Counter>(context, listen: true).count}"),//1
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).add();//2
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
      ),
      body: Center(
//        child: Text("${Provider.of<Counter>(context, listen: false).count}"),//1

      child: Consumer<Counter>( builder: (BuildContext context, Counter counter, _){

        return Text(counter.count);
    })),
//        child: Consumer<Counter>(builder: (BuildContext ctx, Counter counter, child) {
//
//          return Text(Provider.of(ctx, listen: false).count);
//        },),
//      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).add();//2
        },
        child: Icon(Icons.add),
      ),
    );
  }
}