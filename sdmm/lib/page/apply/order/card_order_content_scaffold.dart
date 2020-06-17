import 'package:flutter/material.dart';
import 'package:sdmm/page/apply/order/model/card_model.dart';
import './model/goods_model.dart';
import './model/card_model.dart';
import 'order_content_scaffold.dart';

class CardOrderContentScaffold extends StatefulWidget {
  CardOrderContentScaffold(this.cardModel);
  CardModel cardModel;
  @override
  _CardOrderContentScaffoldState createState() => _CardOrderContentScaffoldState();
}

class _CardOrderContentScaffoldState extends State<CardOrderContentScaffold> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('--------------------------------${widget.cardModel.name}');
    List _goods_list = <GoodsModel>[];
    _goods_list.addAll(widget.cardModel.goods_list);
    _goods_list.addAll(widget.cardModel.pro_list);
    return OrderContentScaffold(goods_list: _goods_list, cardModel: widget.cardModel,);
  }
}
