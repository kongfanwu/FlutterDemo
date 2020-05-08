import 'dart:ffi';

import 'package:flutter/material.dart';
import 'SDMMFeedback.dart';
import 'SDMMMyQRCode.dart';
import 'SDMMUserDetail.dart';
import 'weather.dart';

class SDMMMine extends StatefulWidget {
  @override
  _SDMMMineState createState() => _SDMMMineState();
}

typedef void RowOnTapCallback(TapDownDetails tapDownDetails);

class _SDMMMineState extends State<SDMMMine> {

  List <MineItemModel> items = new List();

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
          GestureDetector(
            onTapDown: (TapDownDetails tapDownDetails) {
              pushUserDetail();
            },
            child: Container(
              color: Colors.white, // 加颜色，否则空白处无事件
              child: Row(
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
            ),
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

  void rowOnTap(TapDownDetails tapDownDetails, int index, List <MineItemModel> items) {
    if (index == 1) { // 我的营销二维码
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
          return SDMMMyQRCode(navBarTitle: items[index].title,); // push
        },
        ),
      );
    }
    else if (index == 2) {// 意见反馈
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
          return SDMMFeedBack(navBarTitle: items[index].title,); // push
        },
        ),
      );
    }
    else if (index == 5) { // 天气
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
          return Weather(navBarTitle: items[index].title,); // push
        },
        ),
      );
    }
  }

  // 跳转用户详情
  void pushUserDetail() {
    print('object');
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
            return SDMMUserDetail();
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    items.add(MineItemModel(title: '邀请入驻', iconName: ''));
    items.add(MineItemModel(title: '我的营销二维码', iconName: ''));
    items.add(MineItemModel(title: '意见反馈', iconName: ''));
    items.add(MineItemModel(title: '使用帮助', iconName: ''));
    items.add(MineItemModel(title: '设置', iconName: ''));
    items.add(MineItemModel(title: '天气预报', iconName: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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