import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './order_scaffold.dart';
import 'package:flui/flui.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import './model/goods_model.dart';
import './model/card_model.dart';
import './order_content_scaffold.dart';
import 'card_order_content_scaffold.dart';

class ServiceOrder extends StatefulWidget {
  ServiceOrder({this.navBarTitle});
  final String navBarTitle;
  @override
  _ServiceOrderState createState() => _ServiceOrderState();
}

class _ServiceOrderState extends State<ServiceOrder> {
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
//  var dismiss;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: FutureBuilder<List<CardItemModel>>(
//        initialData: "我是默认数据",
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              List<CardItemModel> cardItemList = snapshot.data;
              return OrderScaffold(dataList: cardItemList,);
            }
          } else {
            // 请求未结束，显示loading
            return Center(child: CircularProgressIndicator(),);
            return SizedBox();
          }
        },
      ),
      // 获取共享状态的 UserModel , _ 标识结束，它最多可以获取6个参数。 <UserModel> 泛型，要获取的共享对象类型，可以多个参数，用逗号分割
//      body:Consumer<UserModel>(builder: (BuildContext context, UserModel userModel, _){
//        return FutureBuilder<String>(
//          future: getData(userModel.id.toString()),
//          builder: (BuildContext context, AsyncSnapshot snapshot) {
//            // 请求已结束
//            if (snapshot.connectionState == ConnectionState.done) {
//              if (snapshot.hasError) {
//                // 请求失败，显示错误
//                return Text("Error: ${snapshot.error}");
//              } else {
//                // 请求成功，显示数据
//                return OrderScaffold(dataList: _dataList,);
//              }
//            } else {
//              // 请求未结束，显示loading
//              return CircularProgressIndicator();
//            }
//          },
//        );
//      }),
    );
  }

  //服务单-处方服务选择
  Future<Response> getChuFangData(params) async {
    //服务单-处方服务选择
    var response = await DioManager.getInstance().post('v5.serv/pres', params: params);
    return response;
  }

  // 服务单-提卡服务选择
  Future<Response> getTiCardData(params) async {
    //服务单-处方服务选择
    var response = await DioManager.getInstance().post('v5.serv/ti_card', params: params);
    return response;
  }

  // 服务单-产品服务选择
  Future<Response> getGoodsData(params) async {
    //服务单-处方服务选择
    var response = await DioManager.getInstance().post('v5.serv/goods', params: params);
    return response;
  }

  // 服务单-项目服务选择
  Future<Response> getProData(params) async {
    //服务单-处方服务选择
    var response = await DioManager.getInstance().post('v5.serv/pro', params: params);
    return response;
  }

  Future<List<CardItemModel>> getData() async {
    List<CardItemModel> _dataList = new List();

    final userModel = Provider.of<UserModel>(context, listen: false);
    print(userModel.getJoinCode());
    Map<String, dynamic> params = {};
    params['user_id'] = '23923';
    params['token'] = userModel.token;
    params['join_code'] = userModel.getJoinCode();
    print(params);

    // ----------- 处方服务 -----------
    var chuFangResp = await getChuFangData(params);
    if (DioManager.responseState(chuFangResp)) {
      List chuFangList = chuFangResp.data['data']['list'];
      final chuFangGoodsList = chuFangList.map((e) => new GoodsModel.fromJson(e)).toList();
      _dataList.add(CardItemModel(
        title: '处方服务',
        select: true,
        goods_list: chuFangGoodsList,
        child: OrderContentScaffold(goods_list: chuFangGoodsList,),
      ));
    }

    // ----------- 提卡服务 -----------
    var tiCarResp = await getTiCardData(params);
    if (DioManager.responseState(tiCarResp)) {
      // 所有卡集合
      var childrenItems = <CardItemModel>[];

      // 储值卡
      // 序列化卡model
      List storedCardList = tiCarResp.data['data']['stored_card'];
      List <CardModel> storedCardModelList = storedCardList.map((e) => new CardModel.fromJson(e)).toList();
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
      List <CardModel> numCardModelList = numCardList.map((e) => new CardModel.fromJson(e)).toList();
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
      List <CardModel> timeCardModelList = timeCardList.map((e) => new CardModel.fromJson(e)).toList();
      // 根据卡model 生成 CardItemModel 集合，并存入 childrenItems
      final timeCardItemList = timeCardModelList.map((e) {
        return CardItemModel(
          title: e.name,
          cardModel: e,
          child: CardOrderContentScaffold(e),
        );
      }).toList();
      childrenItems.addAll(timeCardItemList);

      _dataList.add(CardItemModel(
        title: '提卡服务',
        child: Container(child: Center(child: Text('提卡服务'),),),
        children: childrenItems,
      ));
    }

    // ----------- 项目服务 -----------
    var proResp = await getProData(params);
    if (DioManager.responseState(proResp)) {
      List proList = proResp.data['data']['list'];
      final goodsList = proList.map((e) => new GoodsModel.fromJson(e)).toList();
      _dataList.add(CardItemModel(
        title: '项目服务',
        goods_list: goodsList,
        child: OrderContentScaffold(goods_list: goodsList,),
      ));
    }

    // ----------- 产品服务 -----------
    var goodsResp = await getGoodsData(params);
    if (DioManager.responseState(goodsResp)) {
      List goodsList = goodsResp.data['data']['list'];
      final goodsGoodsList = goodsList.map((e) => new GoodsModel.fromJson(e)).toList();
      _dataList.add(CardItemModel(
        title: '产品服务',
        goods_list: goodsGoodsList,
        child: OrderContentScaffold(goods_list: goodsGoodsList,),
      ));
    }

    return _dataList;
  }
}

