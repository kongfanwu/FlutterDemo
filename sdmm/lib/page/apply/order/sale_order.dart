import 'package:flutter/material.dart';
import './order_scaffold.dart';

class SaleOrder extends StatefulWidget {
  SaleOrder({this.navBarTitle});
  final String navBarTitle;
  @override
  _SaleOrderState createState() => _SaleOrderState();
}

class _SaleOrderState extends State<SaleOrder> {
  List<CardItemModel> _dataList = new List();

  @override
  void initState() {
    super.initState();
    _dataList.add(CardItemModel(
      title: '处方服务',
      select: false,
      child: Container(child: Center(child: Text('处方服务'),),),
    ));
    _dataList.add(CardItemModel(
      title: '提卡服务',
      child: Container(child: Center(child: Text('提卡服务'),),),
      children: [
        CardItemModel(
          title: '储值卡1',
          select: true,
          child: Container(child: Center(child: Text('储值卡1'),),),
        ),
        CardItemModel(
          title: '储值卡2',
          child: Container(child: Center(child: Text('储值卡2'),),),
        ),
      ],
    ));
    _dataList.add(CardItemModel(
      title: '项目服务',
      select: true,
      child: Container(child: Center(child: Text('项目服务'),),),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
      title: new Text(widget.navBarTitle),
    ),
      body: OrderScaffold(dataList: _dataList,),
    );
  }
}
