

import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {

  CounterWidget({Key key, this.intValue:0});

  final int intValue;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  int _counter;

  // 当Widget第一次插入到Widget树时会被调用
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.intValue;
    print('initState');
  }

//  在调用initState()之后。
//  在调用didUpdateWidget()之后。
//  在调用setState()之后。
//  在调用didChangeDependencies()之后。
//  在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
  @override
  Widget build(BuildContext context) {
    print('build');
    return Container(
      child: FlatButton(
        child: Text('$_counter'),
        onPressed: () {
          setState(() {
            ++_counter;
          });
        },
      ),
    );
  }

  // 在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，然后决定是否需要更新，
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  // 当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print("deactive");
  }

  // 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // 当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
