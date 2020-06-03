import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './order_scaffold.dart';
import 'package:flui/flui.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import './model/goods_model.dart';
import './model/card_model.dart';

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
//            dismiss();
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
//              return OrderScaffold(dataList: _dataList,);
//              return Text("success: ${snapshot.data}");
              List<CardItemModel> cardItemList = snapshot.data;
              return Text("success: ${cardItemList.first.title}");
            }
          } else {
            // 请求未结束，显示loading
            return Center(child: CircularProgressIndicator(),);
//            dismiss = FLToast.loading(text:'加载中...');
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

  //服务单-处方服务选择
  Future<Response> getChuFangData(params) async {
    //服务单-处方服务选择
    var response = await DioManager.getInstance().post('v5.serv/pres', params: params);
    return response;
  }

  Future<List<CardItemModel>> getData() async {
    List<CardItemModel> _dataList = new List();
//    await Future.delayed(Duration(seconds: 1), () {
//      print("延时三秒后请求数据");
//    });

    final userModel = Provider.of<UserModel>(context, listen: false);
    print(userModel.getJoinCode());
    Map<String, dynamic> params = {};
    params['user_id'] = '23923';
    params['token'] = userModel.token;
    params['join_code'] = userModel.getJoinCode();
    print(params);

//    var dismiss = FLToast.loading(text:'加载中...');
//    var future =  Future.wait([getChuFangData(params), getTiCardData(params), getGoodsData(params), getProData(params)]);
//    print('future = $future');
//    var res = future.then((value) {
//      print('value = $value');
//      return '1234';
//    });
//    print(res);

    // 项目服务
    var proResp = await getProData(params);
    List proList = proResp.data['data']['list'];
    final goodsList = proList.map((e) => new GoodsModel.fromJson(e)).toList();
    _dataList.add(CardItemModel(
      title: '项目服务',
      select: true,
      goods_list: goodsList,
      child: Container(child: Center(child: Text('项目服务'),),),
    ));

//    var tiCarResp = await getTiCardData(params);
//    print('tiCarResp = $tiCarResp');


//    _dataList.add(CardItemModel(
//      title: '处方服务1',
//      select: false,
//      child: Container(child: Center(child: Text('处方服务'),),),
//    ));
    return _dataList;
  }
}
