
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberView extends StatefulWidget {

//  const NumberView({
//    Key key,
//    this.onChanged,
//    this.controller = const TextEditingController(),
//    this.focusNode = const FocusNode(),
//  }) : super(key: key);

  ValueChanged<String> onChanged;
  TextEditingController controller;
  FocusNode focusNode;
  // 默认值
  int value;

// TODO: 打算初始化设置 controller 默认值，没设置成功，总报错，后续处理
  NumberView({
    this.onChanged,
    this.controller,
    this.focusNode,
    this.value,
  });

  @override
  _NumberViewState createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {
  TextEditingController get _controller => widget.controller ?? TextEditingController();
  FocusNode get _focusNode => widget.focusNode ?? FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.value == null) {
      widget.value = 0;
    }

    _controller.text = widget.value.toString();
    super.initState();
  }

//  @override
//  void didUpdateWidget(NumberView oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    if (widget.controller == null && oldWidget.controller != null) {
//      _controller = TextEditingController.fromValue(oldWidget.controller.value);
//    }
//    else if (widget.controller != null && oldWidget.controller == null) {
//      _controller = null;
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
            icon:  Icon(Icons.remove_circle_outline),
            onPressed: (){
              var textNum = int.parse(_controller.text);
              --textNum;
              if (textNum < 0) {
                textNum = 0;
              }
              _controller.text = textNum.toString();
              widget.onChanged(_controller.text);
            },
          ),
         Container(
//           color: Colors.orange,
           width: 30,
           child: TextField(
             focusNode: _focusNode,
             controller: _controller,
             keyboardType: TextInputType.text,
             inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//设置只能录入数字[0-9]
             textInputAction: TextInputAction.done,
             style: TextStyle(fontSize: 15, color: Color(0xff333333)),
             textAlign: TextAlign.center,
             decoration: InputDecoration(
               enabledBorder: UnderlineInputBorder( // 没有焦点时将起作用
                 borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0)),
               ),
               focusedBorder: UnderlineInputBorder( // 成为焦点时它将起作用
                 borderSide: BorderSide(color: Color.fromARGB(0, 0, 0, 0)),
               ),
             ),
             onChanged: widget.onChanged,
           ),
         ),
         IconButton(
           padding: const EdgeInsets.all(0),
           constraints: BoxConstraints(
             minWidth: 24,
             minHeight: 24,
           ),
           icon:  Icon(Icons.add_circle_outline),
           onPressed: (){
             var textNum = int.parse(_controller.text);
             ++textNum;
             _controller.text = textNum.toString();
             widget.onChanged(_controller.text);
           },
         ),
        ],
      ),
    );
  }
}
