import 'package:flutter/material.dart';
import 'package:sdmm/page/SDMMBase/gradient_button.dart';

/*
example
TextEditingController _textFieldController = TextEditingController();
_textFieldController.addListener(() {
  print('controller = ${_textFieldController.text}');
});

SearchView(
  hintText:'输入顾客姓名/手机号',
  padding: EdgeInsets.only(left: 20, right: 20),
  textFieldController: _textFieldController,
  onSearchPressed: (text){
    print('onSearchPressed = $text');
  },
),
*/

class SearchView extends StatefulWidget {
  SearchView({
    this.hintText = '',
    this.padding,
    this.keyboardType = TextInputType.text,
    this.textFieldController,
    this.onSearchPressed,
    this.focusNode,
  });

// 默认提示内容
  final String hintText;
  final EdgeInsetsGeometry padding;
  // TextField controller
  final TextEditingController textFieldController;
  // 搜索事件回调
  final void Function(String text) onSearchPressed;
  final TextInputType keyboardType;

  /* 控制获得焦点，失去焦点对象
  *  获取焦点 FocusScope.of(context).requestFocus(focusNode);
  *  失去焦点 focusNode.unfocus();
  **/
  final FocusNode focusNode;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  final double _height = 38.0;
  final borderRadius = BorderRadius.circular(38 / 2);
  var _text = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Container(
        height: _height,
        decoration: BoxDecoration(
//        color: Colors.red,
          borderRadius: borderRadius,
          border: Border.all(color: Color.fromARGB(255, 231, 52, 98), width: 1),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 0),
                child: TextField(
                  focusNode: widget.focusNode,
                  controller: widget.textFieldController,
                  scrollPadding: EdgeInsets.only(top: 0, bottom: 0),
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  autocorrect: true, // 自动获取焦点
                  keyboardType: widget.keyboardType, // 键盘类型
                  decoration: InputDecoration(
                    hintText: widget.hintText,
//                    fillColor: Colors.orangeAccent,
//                    filled: true,
                    contentPadding: EdgeInsets.all(10),
                    enabledBorder: UnderlineInputBorder(
                      // 没有焦点时将起作用
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      // 成为焦点时它将起作用
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (val) {
                    _text = val;
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 3),
              child: GradientButton(
                borderRadius: borderRadius,
                colors: [
                  Color.fromARGB(255, 248, 115, 66),
                  Color.fromARGB(255, 231, 52, 98)
                ],
                height: _height - 8,
                width: 57,
                child: Text('搜索'),
                onPressed: () {
                  widget.onSearchPressed(_text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
