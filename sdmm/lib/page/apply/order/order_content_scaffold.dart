import 'package:flutter/material.dart';
import './model/goods_model.dart';
//import './model/card_model.dart';

class OrderContentScaffold extends StatefulWidget {
  OrderContentScaffold({this.goods_list});
  List <GoodsModel> goods_list;
  @override
  _OrderContentScaffoldState createState() => _OrderContentScaffoldState();
}

class _OrderContentScaffoldState extends State<OrderContentScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(direction: Axis.vertical, children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
//            color: Colors.blue,
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final goodsModel = widget.goods_list[index];
                  return ListTile(title: Text(goodsModel.name),);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.black12,);
                },
                itemCount: widget.goods_list.length,
            ),
          ),
        ),
      ],),
    );
  }
}
