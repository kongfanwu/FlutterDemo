import 'package:flutter/material.dart';

// 定义 数据共享 对象
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({this.data, Widget child}) : super(child:child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {

    // 只会获取组件，不会添加依赖
//    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>();

    // dependOnInheritedWidgetOfExactType 函数会将 context 对应的 Widget 添加到依赖数组里
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    // 返回true  依赖的widget didChangeDependencies函数会被回调
    return oldWidget.data != data;
  }
}

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString()); // 获取共享对象里的data
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}


class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TestWidget(), //子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              onPressed: () => setState(() => ++count),
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
