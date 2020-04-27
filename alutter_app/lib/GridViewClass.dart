import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GridViewClassState();
  }
}

class _GridViewClassState extends State<GridViewClass> {
  ScrollController _gridViewController;

  _createGridViewItem(Color color) {
    return Container(
      color: color,
      height: 80,
    );
  }

  @override
  void initState() {
    _gridViewController = ScrollController()
      ..addListener(() {
        print('${_gridViewController.offset}');
      });
  }

  @override
  Widget build(BuildContext context) {
    List _getContainers() {
      List<Container> containers = new List();
      for (var i = 0; i < 15; i++) {
        containers.add(_createGridViewItem(Colors.primaries[i]));
      }
      return containers;
    }

//    return GridView(
//      scrollDirection: Axis.vertical, // 表示滚动方向，默认是垂直方向，可以设置为水平方向。
//      reverse: false, // 翻转，一般用不到
//      controller: _gridViewController,
//      physics: BouncingScrollPhysics(),
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 4, // 交叉轴方向上个数。
//        mainAxisSpacing: 10,
//        crossAxisSpacing: 10,
//        childAspectRatio: 1 / 3, // 子控件宽高比。
//
//      ),
//      children: _getContainers(),
//    );;

    // 推荐使用此方式创建
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 交叉轴方向上个数。
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 2, // 子控件宽高比。

      ),
      itemCount: 21,
      itemBuilder: (context, index){
        return Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      },
    );

    // 使用GridView.custom构建：
//    return GridView.custom(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 3,
//      ),
//      childrenDelegate: SliverChildBuilderDelegate((context, index) {
//        return Container(
//            height: 80,
//            color: Colors.primaries[index % Colors.primaries.length]);
//      },
//      childCount: 50
//      ),
//    );

    // 使用GridView.count构建：
//    return GridView.count(
//      crossAxisCount: 3,
//      children: List.generate(50, (i) {
//        return Container(
//          height: 80,
//          color: Colors.primaries[i % Colors.primaries.length],
//        );
//      }),
//    );

//    return GridView.extent(
//      maxCrossAxisExtent: 100,
//      children: List.generate(50, (i) {
//        return Container(
//          height: 80,
//          color: Colors.primaries[i % Colors.primaries.length],
//        );
//      }),
//    );
  }
}
