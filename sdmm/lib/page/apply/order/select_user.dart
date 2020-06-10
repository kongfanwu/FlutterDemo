import 'package:flutter/material.dart';
import 'package:sdmm/page/SDMMBase/search_view.dart';

import 'package:sdmm/networking/DioManager.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import './model/customer_model.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'service_order.dart';

class SelectUser extends StatefulWidget {
  SelectUser({this.navBarTitle});
  final String navBarTitle;
  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  TextEditingController _textFieldController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  List<CustomerModel> _dataArray = [];
  var _searchText;
  int _page = 1;

  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController.addListener(() {
      print('controller = ${_textFieldController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: SearchView(
              hintText: '输入顾客姓名/手机号',
              padding: EdgeInsets.only(left: 10, right: 10),
              textFieldController: _textFieldController,
              focusNode: _focusNode,
              onSearchPressed: (text) {
                print('onSearchPressed = $text');
                _searchText = text;
                _focusNode.unfocus(); // 键盘失去焦点
                getData();
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: EasyRefresh(
                onRefresh: () async {
                  _page = 1;
                  getData();
                },
                onLoad: () async {
                  _page++;
                  getData();
                },
                controller: _controller,
                child: ListView.separated(
                  //当子组件太短而不能滚动的时候，需要添加physics: const AlwaysScrollableScrollPhysics(),否则下拉刷新和上拉加载更多都无效，无法触发了
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final customerModel = _dataArray[index];
                    return createCell(index, customerModel, () {
                      onCellTap(customerModel);
                    });
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                        color: Colors.black12, height: 1, thickness: 1);
                  },
                  itemCount: _dataArray.isEmpty ? 0 : _dataArray.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createCell(int index, CustomerModel customerModel, GestureTapCallback onTap) {
    print(customerModel.user_headimgurl);
    return ListTile(
      leading:Image.network(
        customerModel.user_headimgurl,
        width: 50,
        height: 50,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
                child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
            ));
          }
        },
      ),
      title: Text(customerModel.user_name),
      subtitle: Text(customerModel.mobile),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  void onCellTap(CustomerModel customerModel) {
    print(customerModel.user_name);
//    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ServiceOrder(navBarTitle: '服务订单',); // push
    },),);
  }

  Future getData() async {
    final userModel = Provider.of<UserModel>(context, listen: false);
    print(userModel.getJoinCode());
    Map<String, dynamic> params = {};
    params['token'] = userModel.token;
    params['join_code'] = userModel.getJoinCode();
    params['page'] = _page;
    params['pageSize'] = 10;
    params['q'] = _searchText;
    print(params);
    var response = await DioManager.getInstance()
        .post('v5.serv_1/search_user', params: params);
    if (DioManager.responseState(response)) {
      List jsonList = response.data['data']['list'];
      var customerMdoelList =
          jsonList.map((e) => new CustomerModel.fromJson(e)).toList();
      if (_page == 1) {
//        _dataArray.removeRange(0, _dataArray.length - 1);
//        _dataArray.insertAll(0, customerMdoelList);
        _dataArray = customerMdoelList;
      } else {
        _dataArray.insertAll(_dataArray.length - 1, customerMdoelList);
//        _dataArray.addAll(customerMdoelList)
      }
      print('customerMdoelList.length = ${customerMdoelList.length}');
      if (_page == 1) {
        _controller.resetLoadState();
      } else {
        // 没有更多数据 customerMdoelList.length < 10
        _controller.finishLoad(noMore: customerMdoelList.length < 10);
      }
      setState(() {});
    }
  }
}

