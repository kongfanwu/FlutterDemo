import 'package:flutter/material.dart';
import 'package:sdmm/page/SDMMBase/number_view.dart';
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
                  print('itemBuilder = $index');
                  final goodsModel = widget.goods_list[index];
                  return createCell(goodsModel);
                },
                separatorBuilder: (BuildContext context, int index) {
                  print('separatorBuilder = $index');
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
      return createProjectCell(goodsModel);
        break;
      case ServiceType.goods:
        return ListTile(title: Text(goodsModel.name),);
        break;
    }
    return SizedBox();
  }

  // TODO: 做项目cell,在做购物逻辑
  // 项目cell
  Widget createProjectCell(GoodsModel goodsModel) {
    return Container(
//      color: Colors.blue,
    padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: InkWell(
        onTap: ()=> print('1234'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
//                color: Colors.orange,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(goodsModel.name, style: TextStyle(fontSize: 15, color: Color(0xFF333333)),),
                    Text('成交单价：${goodsModel.price}', style: TextStyle(fontSize: 13, color: Color(0xFF666666)),),
                    Text('剩余${goodsModel.num.toString()}次', style: TextStyle(fontSize: 13, color: Color(0xFF666666)),),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                NumberView(
                  onChanged: (val){
                    print(val);
                  },
                ),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
//                  color: Colors.pink,
                  child: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
