import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:sdmm/page/Mine/PickerData.dart';
import 'package:sdmm/public/tool_model.dart';
import './order/order.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:provider/provider.dart';

class SDMMApply extends StatefulWidget {
  @override
  _SDMMApplyState createState() => _SDMMApplyState();
}

class _SDMMApplyState extends State<SDMMApply> {
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ItemModel> _dataList = new List();

  void itemOnTap(ItemModel itemModel) {
    print(itemModel.id);
    if (itemModel.id == '1') {
//      Navigator.of(context).push(
//        MaterialPageRoute(builder: (context) {
//          return OrderManager(navBarTitle: itemModel.title,); // push
//        },),
//      );

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderManager(navBarTitle: itemModel.title,)));
    }
  }

  Widget createItemWidget(ItemModel itemModel) {
    return GestureDetector(
      onTap: () {
        itemOnTap(itemModel);
      },
      child: Container(
        width: 100,
        height: 100,
//      color: Colors.brown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              itemModel.imageName,
              fit: BoxFit.cover,
              width: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(itemModel.title),
          ],
        ),
      ),
    );
  }

  Widget createSectionWidgets(List<ItemModel> dataList) {
    // 外层套 row 、 wxpanded 是为了解决 Wrap 根据内容不知道最大多宽，达不到最大宽度显示
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Wrap(
              spacing: 20,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: dataList.map((e) => createItemWidget(e)).toList(),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dataList.add(ItemModel(
        id: '1',
        title: '订单管理',
        imageName: 'static/img/yingyong_dingdanguanli.png'));
    _dataList.add(ItemModel(
        id: '2',
        title: '订单管理2',
        imageName: 'static/img/yingyong_dingdanguanli.png'));
    _dataList.add(ItemModel(
        id: '3',
        title: '订单管理3',
        imageName: 'static/img/yingyong_dingdanguanli.png'));
    _dataList.add(ItemModel(
        id: '4',
        title: '订单管理4',
        imageName: 'static/img/yingyong_dingdanguanli.png'));
    _dataList.add(ItemModel(
        id: '5',
        title: '订单管理5',
        imageName: 'static/img/yingyong_dingdanguanli.png'));
  }

  @override
  Widget build(BuildContext context) {
//    print('Apply-----------${context.read<UserModel>().name}'); // NO
//    print('Apply2-----------${context.watch<UserModel>().name}'); // OK
    print('apply3--------${Provider.of<UserModel>(context, listen: false).name}'); // OK
//    print('apply4---------${context.select((UserModel p) => p.name)}'); // OK

// OK
//    return Consumer<UserModel>(
//      builder: (BuildContext context, UserModel userModel, _){
//        print(userModel.name);
//        return Text(userModel.name);
//    });

    return Container(
      color: Colors.black12,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: <Widget>[
            createSectionWidgets(_dataList),
          ],
        ),
//      child: Container(color: Colors.blue,),
      ),
    );
  }
}
