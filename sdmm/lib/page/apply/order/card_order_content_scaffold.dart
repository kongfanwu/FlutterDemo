import 'package:flutter/material.dart';
import 'package:sdmm/page/apply/order/model/card_model.dart';
import './model/goods_model.dart';
import './model/card_model.dart';
import 'order_content_scaffold.dart';

/// 提卡服务内容
class CardOrderContentScaffold extends StatefulWidget {
  CardOrderContentScaffold(this.cardModel, {this.onAddShoppingBlock});
  CardModel cardModel;
  // 添加到购物车回调
  final void Function(GoodsModel goodsModel) onAddShoppingBlock;

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
    return OrderContentScaffold(
      goods_list: _goods_list,
      cardModel: widget.cardModel,
      onAddShoppingBlock: widget.onAddShoppingBlock,
    );
  }
}
