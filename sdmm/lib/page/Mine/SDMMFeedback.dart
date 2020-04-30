import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SDMMFeedBack extends StatefulWidget {

  SDMMFeedBack({this.navBarTitle});

  final String navBarTitle;

  @override
  _SDMMFeedBackState createState() => _SDMMFeedBackState();
}

class _SDMMFeedBackState extends State<SDMMFeedBack> {

  Widget createInputView() {
    return Column(
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
              hintText: 'hintText',
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
              print('onChange' + val);
            },
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
            color: Colors.amberAccent,
            height: 200,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 交叉轴 数量
                crossAxisSpacing: 10, // 间距
                mainAxisSpacing: 10, // 主轴 间隔
                childAspectRatio: 3, // 子控件宽高比。
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.black12 // 圆角设置颜色后，Container 的color 就不要再次设置颜色了。会报错
                  ),
                  child: Center(
                    child: Text(items[index].title),
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

  List <FeedbackItemModel> createFeedbackItemList() {
    List <FeedbackItemModel> items = new List();
    items.add(FeedbackItemModel(title: '功能出错', select: false));
    items.add(FeedbackItemModel(title: '出现闪退', select: false));
    items.add(FeedbackItemModel(title: '信息错误', select: false));
    items.add(FeedbackItemModel(title: '页面错乱', select: false));
    items.add(FeedbackItemModel(title: '体验问题', select: false));
    items.add(FeedbackItemModel(title: '出现乱码', select: false));
    items.add(FeedbackItemModel(title: '其他', select: false));
    return items;
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
          createCenterView(
              items: createFeedbackItemList()
          ),
        ],
      )
    );
  }
}

// 反馈按钮model
class FeedbackItemModel {
  FeedbackItemModel({this.title, this.select});
  final String title;
  final bool select;

}
