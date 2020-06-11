import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  EmptyView({this.onTap});

  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {

    print('viewPadding = ${MediaQuery.of(context).viewPadding}');
    print('padding = ${MediaQuery.of(context).padding}');
    print('height = ${MediaQuery.of(context).size.height}');
    // 状态栏、导航栏、ListTile高度分别为24、56、56
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height - 26 - 56 - MediaQuery.of(context).padding.bottom, // status bar height 26 44
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('static/img/nodata.png'),
                ),
                Text(
                  '暂无数据',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                ),
                Expanded(
                  child: SizedBox(),
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
