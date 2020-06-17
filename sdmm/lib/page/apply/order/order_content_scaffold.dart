import 'package:flutter/material.dart';
import 'package:sdmm/page/apply/order/model/order_basic_types.dart';
import './model/goods_model.dart';
import 'model/card_model.dart';
//import './model/card_model.dart';

class OrderContentScaffold extends StatefulWidget {
  OrderContentScaffold({this.goods_list, this.cardModel});
  // 项目、产品 model
  List <GoodsModel> goods_list;
  // 卡 model
  CardModel cardModel;

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
                  return createCell(goodsModel);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.black12, height: 1, thickness: 1);
                },
                itemCount: widget.goods_list.length,
            ),
          ),
        ),
      ],),
    );
  }

  // 根据产品类型创建不同cell
  Widget createCell(GoodsModel goodsModel) {
    print(goodsModel.serviceType);
    switch (goodsModel.serviceType) {
      case ServiceType.chuFang:
        return ListTile(title: Text(goodsModel.name),);
        break;
      case ServiceType.tiKa:
//        goodsModel.cardType == CardType.time
        return ListTile(title: Text(goodsModel.name),);
        break;
      case ServiceType.project:
// TODO: 做项目cell,在做购物逻辑
        return ListTile(title: Text(goodsModel.name),);
        break;
      case ServiceType.goods:
        return ListTile(title: Text(goodsModel.name),);
        break;
    }


    return SizedBox();
  }
}
