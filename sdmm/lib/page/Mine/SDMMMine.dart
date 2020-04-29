import 'dart:ffi';

import 'package:flutter/material.dart';
import 'SDMMFeedback.dart';

class SDMMMine extends StatefulWidget {
  @override
  _SDMMMineState createState() => _SDMMMineState();
}

typedef void RowOnTapCallback(TapDownDetails tapDownDetails);

class _SDMMMineState extends State<SDMMMine> {
  // 头部视图
  Widget createTopWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white // 圆角设置颜色后，Container 的color 就不要再次设置颜色了。会报错
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴的对齐方式
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴的对齐方式
            children: <Widget>[
              Container(
//                color: Colors.red,
                padding:
                    EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
                child: Image.asset(
                  'static/img/head.png',
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
              Flexible(
                child: Container(
//                  color: Colors.red,
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('售后美容师'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('顾客保有130人'),
                          SizedBox(width: 10),
                          Text('工作3年'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black45,
                size: 15
              ),
            ],
          ),
          Divider(
            height: 10,
            color: Colors.black45,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, bottom: 13),
            child: Text(
              '售后美容师',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 列表视图
  Widget createListView(BuildContext context, List <MineItemModel> items, {void Function(TapDownDetails tapDownDetails, int index) onTap}) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white // 圆角设置颜色后，Container 的color 就不要再次设置颜色了。会报错
          ),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTapDown: (TapDownDetails tapDownDetails) {
                onTap(tapDownDetails, index);
              },
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      color: Colors.white, // 不设置颜色。点击空白区域没有点击事件。设置就会有事件，猜测， 不设置 Flutter 不渲染 View
                      padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.supervised_user_circle),
                          SizedBox(width: 10),
                          Text(items[index].title)
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 15,),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1, color: Colors.black45);
          },
          itemCount: items.length
        ),
      ),
    );
  }

  Void rowOnTap(TapDownDetails tapDownDetails, int index, List <MineItemModel> items) {
    // 意见反馈
    if (index == 2) {
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
          return SDMMFeedBack(navBarTitle: items[index].title,); // push
        },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    List <MineItemModel> items = new List();
    items.add(MineItemModel(title: '邀请入驻', iconName: ''));
    items.add(MineItemModel(title: '我的营销二维码', iconName: ''));
    items.add(MineItemModel(title: '意见反馈', iconName: ''));
    items.add(MineItemModel(title: '使用帮助', iconName: ''));
    items.add(MineItemModel(title: '设置', iconName: ''));

    return Container(
      color: Color.fromARGB(1, 241, 241, 241),
      child: Column(
        children: <Widget>[
          createTopWidget(context),
          SizedBox(height: 10),
          createListView(context, items, onTap: (TapDownDetails tapDownDetails, int index){
//            print('row click:${items[index].title}');
            rowOnTap(tapDownDetails, index, items);
          }),
        ],
      ),
    );
  }
}

class MineItemModel {
  const MineItemModel({this.title, this.iconName});
  final String iconName;
  final String title;
}