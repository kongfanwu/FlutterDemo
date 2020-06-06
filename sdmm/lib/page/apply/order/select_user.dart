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
  var _searchText;
  List<CustomerModel> _dataArray = [];
  FocusNode _focusNode = FocusNode();

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
              hintText:'输入顾客姓名/手机号',
              padding: EdgeInsets.only(left: 10, right: 10),
              textFieldController: _textFieldController,
              focusNode: _focusNode,
              onSearchPressed: (text){
                print('onSearchPressed = $text');
                _searchText = text;
                _focusNode.unfocus(); // 键盘失去焦点
                getData();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final customerModel = _dataArray[index];
                  return ListTile(title: Text('${customerModel.user_name}'));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.black12, height: 1, thickness: 1);
                },
                itemCount: _dataArray.isEmpty ? 0 : _dataArray.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getData() async {
    final userModel = Provider.of<UserModel>(context, listen: false);
    print(userModel.getJoinCode());
    Map<String, dynamic> params = {};
    params['token'] = userModel.token;
    params['join_code'] = userModel.getJoinCode();
    params['page'] = '1';
    params['q'] = _searchText;
    print(params);
    var response = await DioManager.getInstance().post('v5.serv_1/search_user', params: params);
    if (DioManager.responseState(response)) {
      List jsonList = response.data['data']['list'];
      final customerMdoelList = jsonList.map((e) => new CustomerModel.fromJson(e)).toList();
      _dataArray = customerMdoelList;
      setState(() {});
    }
  }

}
// TODO: 下一步 做上下拉刷新