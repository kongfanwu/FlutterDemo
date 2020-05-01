import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';

class SDMMFeedBack extends StatefulWidget {

  SDMMFeedBack({this.navBarTitle});

  final String navBarTitle;

  @override
  _SDMMFeedBackState createState() => _SDMMFeedBackState();
}

class _SDMMFeedBackState extends State<SDMMFeedBack> {

  List <FeedbackItemModel> items = new List();
  bool _submitBtnEnable = false;
  // 创建编辑回调控制器
  TextEditingController _pwdController = new TextEditingController();

  Widget createInputView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 25, bottom: 25, left: 10),
          child: Text("留下宝贵意见，会有意外惊喜呦！"),
        ),
        Container(
          height: 150,
//          color: Colors.cyan,
          padding: EdgeInsets.only(top: 0, bottom: 25, left: 10, right: 10),
          child: TextField(
            maxLines: 10,
            autocorrect: true, // 自动获取焦点
            keyboardType: TextInputType.text, // 键盘类型
            decoration: InputDecoration(
              hintText: '请输入',
              fillColor: Colors.black12,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            onChanged: (val) { // 获取输入回调方式一
              showSubmitButtonState();
            },
            controller: _pwdController,
          ),
        ),
      ],
    );
  }

  Widget createCenterView({List<FeedbackItemModel> items}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('反馈类型'),
              Text('（可不填）', style: TextStyle(color: Colors.black26),),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 85,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 交叉轴 数量
                crossAxisSpacing: 10, // 间距
                mainAxisSpacing: 10, // 主轴 间隔
                childAspectRatio: 3, // 子控件宽高比。
              ),
              itemBuilder: (context, index) {
                return GestureDetector( // 点击事件
                  onTapDown: (TapDownDetails tapDownDetails) {
                    setState(() {
                      items[index].select = !items[index].select;
                      showSubmitButtonState();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: items[index].select ? Color.fromARGB(255, 254, 240, 248) : Colors.black12, // 圆角设置颜色后，Container 的color 就不要再次设置颜色了。会报错
                      border: Border.all(
                        color: items[index].select ? Color.fromARGB(255, 239, 22, 128) : Color.fromARGB(0, 0, 0, 0),
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        items[index].title,
                        style: TextStyle(color: items[index].select ? Color.fromARGB(255, 239, 22, 128) : Colors.black),
                      ),
                    ),
                  ),
                );
              },
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createBottomView() {
    // Row(横向)-> Expanded(横向撑满)-> Container(加左右间距)-> RaisedButton. 初学者的思路，这布局甚是觉得恶心。可能有其他方式。
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: RaisedButton(
              child: Text('提交'),
              textColor: Colors.white,
              disabledTextColor: Colors.white,
              color: Color.fromARGB(255, 239, 22, 128),
              disabledColor: Color.fromARGB(255, 207, 208, 207),
              onPressed: _submitBtnEnable ? (){
                var params = <String, dynamic> {};
                params['feedbackContext'] = _pwdController.text;

                var selectTitles = <String>[];
                params['feedbackTagList'] = selectTitles;
                for (var itemModel in items) {
                  if (itemModel.select) {
                    selectTitles.add(itemModel.title);
                  }
                }
                print(params.toString());
                Navigator.pop(context);
              } : null,
            ),
          ),
        ),
      ],
    );
  }

  void createFeedbackItemList() {
    items.add(FeedbackItemModel(title: '功能出错', select: false));
    items.add(FeedbackItemModel(title: '出现闪退', select: false));
    items.add(FeedbackItemModel(title: '信息错误', select: false));
    items.add(FeedbackItemModel(title: '页面错乱', select: false));
    items.add(FeedbackItemModel(title: '体验问题', select: false));
    items.add(FeedbackItemModel(title: '出现乱码', select: false));
    items.add(FeedbackItemModel(title: '其他', select: false));
  }

  // 输入反馈内容 && 至少选中一个反馈类型。将提交按钮高亮显示
  void showSubmitButtonState() {
    bool isSelect = false;
    for (var itemModel in items) {
      if (itemModel.select) {
        isSelect = true;
        break;
      }
    }
    setState(() {
      _submitBtnEnable = isSelect && _pwdController.text.length > 0;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    createFeedbackItemList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: Column(
        children: <Widget>[
          createInputView(),
          createCenterView(items: items),
          createBottomView(),
        ],
      )
    );
  }
}

// 反馈按钮model
class FeedbackItemModel {
  FeedbackItemModel({this.title, this.select});
  final String title;
  bool select;
}
