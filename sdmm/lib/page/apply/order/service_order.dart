import 'package:flutter/material.dart';
import './order_scaffold.dart';
import 'package:flui/flui.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (BuildContext context, UserModel userModel, _){
        print(userModel.name);
        return Text(userModel.name);
    });

//    return Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.navBarTitle),
//      ),
//      // 获取共享状态的 UserModel , _ 标识结束，它最多可以获取6个参数。 <UserModel> 泛型，要获取的共享对象类型，可以多个参数，用逗号分割
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
//    );
  }

  Future<String> getData(String userId) async {
//    return Future.error('error12');
    print('userId = $userId');
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");

    Map<String, dynamic> params = {};
//    params['user_id'] = userModel.id;
    var dismiss = FLToast.loading(text:'加载中...');
    //服务单-处方服务选择
    DioManager.getInstance().post('v5.serv/pres', params: params, successCallBack: (chudDta, success) {
      if (!success) {
        dismiss();
        return;
      }
      // 服务单-提卡服务选择
      DioManager.getInstance().post('v5.serv/ti_card', params: params, successCallBack: (cardData, success) {
        if (!success) {
          dismiss();
          return;
        }
        // 服务单-产品服务选择
        DioManager.getInstance().post('v5.serv/goods', params: params, successCallBack: (goodsData, success) {
          if (!success) {
            dismiss();
            return;
          }
          // 服务单-项目服务选择
          DioManager.getInstance().post('v5.serv/pro', params: params, successCallBack: (proData, success) {
            if (!success) {
              dismiss();
              return;
            }

          });
        });
      });
    });
  }
}
