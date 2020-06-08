import 'package:flutter/material.dart';
import 'package:sdmm/page/SDMMBase/search_view.dart';

import 'package:sdmm/networking/DioManager.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import './model/customer_model.dart';

class SelectUser extends StatefulWidget {
  SelectUser({this.navBarTitle});
  final String navBarTitle;
  @override
  _SelectUserState createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  TextEditingController _textFieldController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  static CustomerModel LOADING_FINISH = CustomerModel.fromJson(Map());
  List<CustomerModel> _dataArray = [LOADING_FINISH];
  var _searchText;
  // 没有更多数据标识： 默认 false
  bool _noMoreData = false;
  int _page = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController.addListener(() {
      print('controller = ${_textFieldController.text}');
    });
  }

  Widget getLoadingWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding:
            EdgeInsets.fromLTRB(10, 10, 5, 10),
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              strokeWidth: 3,
            ),
          ),
          Container(
            padding:
            EdgeInsets.fromLTRB(5, 10, 10, 10),
            child: Text(
              "正在加载中...",
              style: TextStyle(
                  fontSize: 16, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Widget getNoMoreData() {
    return Container(
      alignment: Alignment.center,
      child: Text("已经到底了 o(╯□╰)o", style: TextStyle(fontSize: 16, color: Colors.blue)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
    );
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
              child: RefreshIndicator(
                onRefresh: () {
                  _page = 1;
                  return getData().whenComplete(() => print('whenComplete'));
                },
                child: Scrollbar(
                  child: ListView.separated(
                    //当子组件太短而不能滚动的时候，需要添加physics: const AlwaysScrollableScrollPhysics(),否则下拉刷新和上拉加载更多都无效，无法触发了
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      // 最后一个元素
                      if (_dataArray[index] == LOADING_FINISH) {
                        // 没有更多数据
                        if (_noMoreData) {
                          return getNoMoreData();
                        }
                        // 下一页
                        else {
                          _page++;
                          getData();
                          return getLoadingWidget();
                        }
                      }

                      final customerModel = _dataArray[index];
                      return ListTile(
                          title: Text('${customerModel.user_name}'));
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
          ),
        ],
      ),
    );
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
      final customerMdoelList =
          jsonList.map((e) => new CustomerModel.fromJson(e)).toList();
      if (_page == 1) {
        _dataArray.removeRange(0, _dataArray.length - 2);
        _dataArray.insertAll(_dataArray.length - 1, customerMdoelList);
      } else {
        _dataArray.insertAll(_dataArray.length - 1, customerMdoelList);
      }
      print('customerMdoelList.length = ${customerMdoelList.length}');
      // 没有更多数据
      if (customerMdoelList.length < 10) {
        _noMoreData = true;
      }

      Future.delayed(Duration(seconds: 3),(){
        setState(() {});
      });


    }
  }
}

