import 'package:flutter/material.dart';

class WrapFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          runAlignment: WrapAlignment.end,
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(
                  backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
          ],
        ),
      ],
    );
  }
}
