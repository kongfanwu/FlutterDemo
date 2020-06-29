import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sdmm/page/SDMMBase/shopping_cart_Info.dart';
import 'package:sdmm/page/SDMMBase/shopping_cart_view.dart';
import 'package:sdmm/page/apply/order/model/order_basic_types.dart';
import 'package:sdmm/page/apply/order/model/shopping_cart_manager.dart';
import 'package:sdmm/page/apply/order/service_order_select_jishi.dart';
import 'package:sdmm/public/xmh_loading_state_mixin.dart';
import './order_scaffold.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import './model/goods_model.dart';
import './model/card_model.dart';
import './order_content_scaffold.dart';
import 'card_order_content_scaffold.dart';
import './model/customer_model.dart';
import 'package:sdmm/page/SDMMBase/empty_widget.dart';
import 'package:provider/provider.dart';

class ServiceOrder extends StatefulWidget {
  ServiceOrder({this.navBarTitle, this.customerModel});
  final String navBarTitle;
  // 选中的顾客model
  final CustomerModel customerModel;
  @override
  _ServiceOrderState createState() => _ServiceOrderState();
}

class _ServiceOrderState extends State<ServiceOrder> with XMHLoadingStateMixin {
  List<CardItemModel> _dataList = new List();
  final _shoppingCartManager = ShoppingCartManager();
  // 是否显示购物车详情
  var _showShoppingCartInfo = false;

  @override
  void initState() {
    super.initState();
    widget.customerModel.user_id = 23923;
//    getData1();
  }

    @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value:  ShoppingCartManager())],
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(widget.navBarTitle),
        ),
        body: Column(
          children: <Widget>[
            Builder(builder: (BuildContext context) {
              return FlatButton(
                child: Text('button'),
                onPressed: (){
                  final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
                  print(shoppingCartManager.goodsList);

                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (context) {
                        return ServiceOrderSelectJishi(
                          navBarTitle: '服务订单',
                          customerModel: widget.customerModel,
                        ); // push
                      },
                    ),
                  );
                },
              );
            }),
            Builder(builder: (BuildContext context) {
              return FlatButton(
                child: Text('button1'),
                onPressed: (){
                  final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
                  print(shoppingCartManager.goodsList);

                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (context) {
                        return Test(); // push
                      },
                    ),
                  );
                },
              );
            }),

            FlatButton(
              child: Text('button2'),
              onPressed: (){
//                final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
//                print(shoppingCartManager.goodsList);
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (context) {
                      return Test(); // push
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [ChangeNotifierProvider.value(value: _shoppingCartManager)],
//      child: buildLoadingContainer(
//        child: Scaffold(
//          appBar: new AppBar(
//            title: new Text(widget.navBarTitle),
//          ),
//          body: Container(
//            child: Stack(
//              alignment: Alignment.center,
//              fit: StackFit
//                  .expand, // 此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。
//              children: <Widget>[
//                // 无数据加载空视图，有数据加载内容View
//                _dataList.isEmpty
//                    ? EmptyView(onTap: () {
//                  widget.customerModel.user_id = 23923;
//                  getData1();
//                })
//                    : OrderScaffold(
//                  dataList: _dataList,
//                ),
//                // 购物车详情
//                _showShoppingCartInfo
//                    ? Positioned(
//                  bottom: 0,
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height,
//                  child: ShoppingCartInfo(
//                    onRemovePressed: () => setState(() =>
//                    _showShoppingCartInfo = !_showShoppingCartInfo),
//                  ),
//                )
//                    : SizedBox(),
//                // 购物车View
//                Positioned(
//                  bottom: 49.0,
//                  width: MediaQuery.of(context).size.width,
//                  height: 56.0,
//                  child: Consumer<ShoppingCartManager>(
//                    builder: (context, ShoppingCartManager shoppingCartManager,
//                        child) {
//                      return Builder(
//                        builder: (BuildContext context) {
//                          return ShoppingCartView(
//                            price: shoppingCartManager.allPrice,
//                            showShoppingCartInfoPressed: () => setState(() =>
//                            _showShoppingCartInfo =
//                            !_showShoppingCartInfo), // 显示隐藏购物车
//                            payPressed: () {
//                              print('去支付');
//                              final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
//                              print(shoppingCartManager.goodsList);
//
//                              Navigator.of(context).push(
//                                new MaterialPageRoute(
//                                  builder: (context) {
//                                    return ServiceOrderSelectJishi(
//                                      navBarTitle: '服务订单',
//                                      customerModel: widget.customerModel,
//                                    ); // push
//                                  },
//                                ),
//                              );
//
////                          _displaySnackBar(context);
//
//
//                            },
//                          );
//                        },
//                      );
//                    },
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }

  _displaySnackBar(BuildContext context) {
    final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
    print(shoppingCartManager.goodsList);
//    final snackBar = SnackBar(content: Text('老孟'));
//    Scaffold.of(context).showSnackBar(snackBar);
  }

  //服务单-处方服务选择
  Future<Response> getChuFangData(params) async {
    //服务单-处方服务选择
    var response =
        await DioManager.getInstance().post('v5.serv/pres', params: params);
    return response;
  }

  // 服务单-提卡服务选择
  Future<Response> getTiCardData(params) async {
    //服务单-处方服务选择
    var response =
        await DioManager.getInstance().post('v5.serv/ti_card', params: params);
    return response;
  }

  // 服务单-产品服务选择
  Future<Response> getGoodsData(params) async {
    //服务单-处方服务选择
    var response =
        await DioManager.getInstance().post('v5.serv/goods', params: params);
    return response;
  }

  // 服务单-项目服务选择
  Future<Response> getProData(params) async {
    //服务单-处方服务选择
    var response =
        await DioManager.getInstance().post('v5.serv/pro', params: params);
    return response;
  }

  void getData1() async {
    await loading(getData());
  }

  Future<List<CardItemModel>> getData() async {
    List<CardItemModel> _dataList = new List();

    final userModel = Provider.of<UserModel>(context, listen: false);
    print(userModel.getJoinCode());
    Map<String, dynamic> params = {};
//    params['user_id'] = '23923';
    params['user_id'] = widget.customerModel.user_id;
    params['token'] = userModel.token;
    params['join_code'] = userModel.getJoinCode();
    print(params);

    // ----------- 处方服务 -----------
    var chuFangResp = await getChuFangData(params);
    if (DioManager.responseState(chuFangResp)) {
      List chuFangList = chuFangResp.data['data']['list'];
      final chuFangGoodsList =
          chuFangList.map((e) => new GoodsModel.fromJson(e)).toList();
      // 绑定类型
      chuFangGoodsList.forEach((element) {
        element.serviceType = ServiceType.chuFang;
      });

      if (chuFangGoodsList.isNotEmpty) {
        _dataList.add(CardItemModel(
          title: '处方服务',
          goods_list: chuFangGoodsList,
          child: OrderContentScaffold(
            goods_list: chuFangGoodsList,
          ),
        ));
      }
    }

    // ----------- 提卡服务 -----------
    final serviceType = ServiceType.tiKa;
    var tiCarResp = await getTiCardData(params);
    if (DioManager.responseState(tiCarResp)) {
      // 所有卡集合
      var childrenItems = <CardItemModel>[];

      // 储值卡
      // 序列化卡model
      List storedCardList = tiCarResp.data['data']['stored_card'];
      List<CardModel> storedCardModelList =
          storedCardList.map((e) => new CardModel.fromJson(e)).toList();
      // 绑定卡类型
      storedCardModelList.forEach((e) {
        e.serviceType = serviceType;
        e.cardType = CardType.stored;

        // 内部项目、产品集合model也配置上类型。后续考虑model序列化时映射
        e.pro_list.forEach((element) {
          element.serviceType = e.serviceType;
          element.cardType = e.cardType;
        });
        e.goods_list.forEach((element) {
          element.serviceType = e.serviceType;
          element.cardType = e.cardType;
        });
      });

      // 根据卡model 生成 CardItemModel 集合，并存入 childrenItems
      final storeCardItemList = storedCardModelList.map((e) {
        return CardItemModel(
          title: e.name,
          cardModel: e,
          child: CardOrderContentScaffold(e),
        );
      }).toList();
      childrenItems.addAll(storeCardItemList);

      // 任选卡
      // 序列化卡model
      List numCardList = tiCarResp.data['data']['card_num'];
      List<CardModel> numCardModelList =
          numCardList.map((e) => new CardModel.fromJson(e)).toList();
      numCardModelList.forEach((e) {
        e.serviceType = serviceType;
        e.cardType = CardType.num;

        // 内部项目、产品集合model也配置上类型。后续考虑model序列化时映射
        e.pro_list.forEach((element) {
          element.serviceType = e.serviceType;
          element.cardType = e.cardType;
        });
        e.goods_list.forEach((element) {
          element.serviceType = e.serviceType;
          element.cardType = e.cardType;
        });
      });
      // 根据卡model 生成 CardItemModel 集合，并存入 childrenItems
      final numCardItemList = numCardModelList.map((e) {
        return CardItemModel(
          title: e.name,
          cardModel: e,
          child: CardOrderContentScaffold(e),
        );
      }).toList();
      childrenItems.addAll(numCardItemList);

      // 时间卡
      // 序列化卡model
      List timeCardList = tiCarResp.data['data']['card_time'];
      List<CardModel> timeCardModelList =
          timeCardList.map((e) => new CardModel.fromJson(e)).toList();
      timeCardModelList.forEach((e) {
        e.serviceType = serviceType;
        e.cardType = CardType.time;

        // 内部项目、产品集合model也配置上类型。后续考虑model序列化时映射
        e.pro_list.forEach((element) {
          element.serviceType = e.serviceType;
          element.cardType = e.cardType;
        });
        e.goods_list.forEach((element) {
          element.serviceType = e.serviceType;
          element.cardType = e.cardType;
        });
      });
      // 根据卡model 生成 CardItemModel 集合，并存入 childrenItems
      final timeCardItemList = timeCardModelList.map((e) {
        return CardItemModel(
          title: e.name,
          cardModel: e,
          child: CardOrderContentScaffold(
            e,
            onAddShoppingBlock: (GoodsModel goodsModel) {
              print(goodsModel.name);
            },
          ),
        );
      }).toList();
      childrenItems.addAll(timeCardItemList);

      if (childrenItems.isNotEmpty) {
        // 将第一个数据设置默认选中状态
        childrenItems.first.select = true;

        _dataList.add(CardItemModel(
          title: '提卡服务',
          child: Container(
            child: Center(
              child: Text('提卡服务'),
            ),
          ),
          children: childrenItems,
        ));
      }
    }

    // ----------- 项目服务 -----------
    var proResp = await getProData(params);
    if (DioManager.responseState(proResp)) {
      List proList = proResp.data['data']['list'];
      final goodsList = proList.map((e) => new GoodsModel.fromJson(e)).toList();
      goodsList.forEach((element) {
        element.serviceType = ServiceType.project;
      });
      if (goodsList.isNotEmpty) {
        _dataList.add(CardItemModel(
          title: '项目服务',
          goods_list: goodsList,
          child: OrderContentScaffold(
            goods_list: goodsList,
            onAddShoppingBlock: (GoodsModel goodsModel) {
              print(goodsModel.price);
              // 获取购物车管理者model,并添加到购物车. 注意： 这里的context 会直接向上查找，但是 ShoppingCartManager 在本 context 注册的，会出现找不到情况
//              final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
              _shoppingCartManager.add(goodsModel);
            },
          ),
        ));
      }
    }

    // ----------- 产品服务 -----------
    var goodsResp = await getGoodsData(params);
    if (DioManager.responseState(goodsResp)) {
      List goodsList = goodsResp.data['data']['list'];
      final goodsGoodsList =
          goodsList.map((e) => new GoodsModel.fromJson(e)).toList();
      goodsGoodsList.forEach((element) {
        element.serviceType = ServiceType.goods;
      });
      if (goodsGoodsList.isNotEmpty) {
        _dataList.add(CardItemModel(
          title: '产品服务',
          goods_list: goodsGoodsList,
          child: OrderContentScaffold(
            goods_list: goodsGoodsList,
            onAddShoppingBlock: (GoodsModel goodsModel) {},
          ),
        ));
      }
    }

    // 将第一个数据设置默认选中状态
    _dataList.first.select = true;

    setState(() {
      this._dataList = _dataList;
    });
  }
}


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);
    return Container();
  }
}
