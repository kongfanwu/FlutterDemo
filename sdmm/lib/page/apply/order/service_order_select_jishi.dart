import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:sdmm/page/apply/order/model/goods_model.dart';
import 'package:sdmm/page/apply/order/model/jishi_model.dart';
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
  // 购物车管理者
  var shoppingCartManager;
  // 选中技师集合
  List<JiShiModel> _jishiList = new List();

  Widget getListView() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final goodsModel = shoppingCartManager.goodsList[index];
        return createCell(goodsModel);
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 1,
        );
      },
      itemCount: shoppingCartManager.goodsList.length,
    );
  }

  Widget createCell(GoodsModel goodsModel) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(goodsModel.name),
              ),
              IconButton(
                iconSize: 18,
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                  print("delete");
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("${goodsModel.shichang}分钟"),
          ),
          Container(
            child: Column(
              children: <Widget>[
                // DOTO: 下一步：做添加技师，删除功能。目前嵌套 ListView 报错
//                _jishiList.length == 0
//                    ? Container(
//                        padding: EdgeInsets.only(left: 10),
//                        child: Text("请选择技师："),
//                      )
//                    : ListView.builder(
//                        itemCount: _jishiList.length,
//                        itemExtent: 30.0, //强制高度为50.0
//                        itemBuilder: (BuildContext context, int index) {
//                          return ListTile(title: Text("$index"));
//                        }),
                IconButton(
                  iconSize: 18,
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print("delete");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    shoppingCartManager =
        Provider.of<ShoppingCartManager>(context, listen: false);
    print(shoppingCartManager.goodsList);

    _jishiList.add(JiShiModel(1, "name"));
    _jishiList.add(JiShiModel(2, "nam2"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    context.dependOnInheritedElement(ancestor)
//    final shoppingCartManager = context.watch<ShoppingCartManager>();
//  print('Apply1-----------${context.read<ShoppingCartManager>().goodsList}'); // NO
//  print('Apply2-----------${context.watch<ShoppingCartManager>().goodsList}'); // OK
//  print('Apply3--------${Provider.of<ShoppingCartManager>(context, listen: true).goodsList}'); // OK
//  print('Apply4---------${context.select((ShoppingCartManager p) => p.goodsList)}'); // OK
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: Container(
//        padding: EdgeInsets.only(left: 10, right: 10),
        color: Color(0xfff5f5f5),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            // 顾客信息
            Positioned(
              top: 0,
              left: 10,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('顾客信息'),
                        Text(
                            '${widget.customerModel.user_name} (${widget.customerModel.mobile})'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 列表
            Positioned(
              top: 44 + 10.0,
              left: 10,
              bottom: MediaQuery.of(context).viewPadding.bottom + 44 + 10,
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width - 20,
                      child: Center(
                        child: Text(
                          '商品服务清单',
                          style:
                              TextStyle(color: Color(0xff333333), fontSize: 17),
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    Expanded(
                      child: getListView(),
                    ),
                  ],
                ),
              ),
            ),
            // 底部按钮
            Positioned(
              bottom: MediaQuery.of(context).viewPadding.bottom,
              left: 10,
              child: Container(
                height: 44,
                width: MediaQuery.of(context).size.width - 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 165,
                      height: 44,
                      child: FlatButton(
                          child: Text(
                            '追加服务',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          color: Color(0xffE73462),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          onPressed: () => Navigator.pop(context)),
                    ),
                    SizedBox(
                      width: 165,
                      height: 44,
                      child: FlatButton(
                        child: Text(
                          '完成服务',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        color: Color(0xffE73462),
                        shape: const RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
