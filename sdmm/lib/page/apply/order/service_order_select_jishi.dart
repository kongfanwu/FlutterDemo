import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:sdmm/page/apply/order/model/shopping_cart_manager.dart';
import 'model/customer_model.dart';

/// 服务单，项目选择技师
class ServiceOrderSelectJishi extends StatefulWidget {
  ServiceOrderSelectJishi({this.navBarTitle, this.customerModel});
  final String navBarTitle;
  // 选中的顾客model
  final CustomerModel customerModel;

  @override
  _ServiceOrderSelectJishiState createState() =>
      _ServiceOrderSelectJishiState();
}

class _ServiceOrderSelectJishiState extends State<ServiceOrderSelectJishi> {
  @override
  Widget build(BuildContext context) {
    final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
//    context.dependOnInheritedElement(ancestor)
//    final shoppingCartManager = context.watch<ShoppingCartManager>();

//  print('Apply1-----------${context.read<ShoppingCartManager>().goodsList}'); // NO
//  print('Apply2-----------${context.watch<ShoppingCartManager>().goodsList}'); // OK
//  print('Apply3--------${Provider.of<ShoppingCartManager>(context, listen: true).goodsList}'); // OK
//  print('Apply4---------${context.select((ShoppingCartManager p) => p.goodsList)}'); // OK
    InheritedWidget
   return Container();

//    return Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.navBarTitle),
//      ),
//      body: Container(
////        padding: EdgeInsets.only(left: 10, right: 10),
//        color: Color(0xfff5f5f5),
//        child: Stack(
//          children: <Widget>[
//            Positioned(
//              top: 0,
//              child: Container(color: Theme.of(context).primaryColor, height: 30, width: MediaQuery.of(context).size.width,),
//            ),
//            // 顾客信息
//            Positioned(
//              top: 0,
//              left: 10,
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    height: 44,
//                    width: MediaQuery.of(context).size.width - 20,
//                    decoration: BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: BorderRadius.circular(5),
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: <Widget>[
//                        Text('顾客信息'),
//                        Text('${widget.customerModel.user_name} (${widget.customerModel.mobile})'),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            // 列表
//            Positioned(
//              top: 44 + 10.0,
//              left: 10,
//              bottom: MediaQuery.of(context).viewPadding.bottom + 44 + 10,
//              child: Container(
//                width: MediaQuery.of(context).size.width - 20,
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.circular(5),
//                ),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      height: 44,
//                      width: MediaQuery.of(context).size.width - 20,
//                      child: Center(
//                        child: Text('商品服务清单', style: TextStyle(color: Color(0xff333333), fontSize: 17),),
//                      ),
//                    ),
//                    Divider(height: 1,),
//                    Builder(builder: (BuildContext context) {
//
//                      return ListView.separated(
//                        itemBuilder: (BuildContext context, int index) {
//                          final goodsModel = shoppingCartManager.goodsList[index];
//                          return Container(
//                            child: Text(goodsModel.name),
//                          );
//                        },
//                        separatorBuilder: (BuildContext context, int index) {
//                          return Divider(height: 1,);
//                        },
//                        itemCount: shoppingCartManager.goodsList.length,
//                      );
//                    },),
//
//                  ],
//                ),
//              ),
//            ),
//            // 底部按钮
//            Positioned(
//              bottom: MediaQuery.of(context).viewPadding.bottom,
//              left: 10,
//              child: Container(
//                height: 44,
//                width: MediaQuery.of(context).size.width - 20,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    SizedBox(
//                      width: 165,
//                      height: 44,
//                      child: FlatButton(
//                        child: Text('追加服务', style: TextStyle(color: Colors.white, fontSize: 17),),
//                        color: Color(0xffE73462),
//                        shape: const RoundedRectangleBorder(
//                            side: BorderSide.none,
//                            borderRadius: BorderRadius.all(Radius.circular(5))
//                        ),
//                        onPressed: () => Navigator.pop(context)
//                      ),
//                    ),
//                    SizedBox(
//                      width: 165,
//                      height: 44,
//                      child: FlatButton(
//                        child: Text('完成服务', style: TextStyle(color: Colors.white, fontSize: 17),),
//                        color: Color(0xffE73462),
//                        shape: const RoundedRectangleBorder(
//                            side: BorderSide.none,
//                            borderRadius: BorderRadius.all(Radius.circular(5))
//                        ),
//                        onPressed: () {
//
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
  }
}


