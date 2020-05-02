import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//typedef GestureTapDownCallback = void Function(TapDownDetails details);

class SDMMDividerStyle {
  SDMMDividerStyle({
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
});
  // 详情使用方法看 Divider 类对应属性描述
  final double height;
  final double thickness;
  final double indent;
  final double endIndent;
  final Color color;
}

// ignore: must_be_immutable
class SDMMRow extends StatefulWidget {

  SDMMRow({
    this.padding,
    this.color,
    this.onTapDown,
    this.child,
    this.showArrow = false,
    this.showArrowPadding,
    this.dividerStyle,
    this.dividerHidden = false,
  });

  final EdgeInsetsGeometry padding;
  final Color color; // 背景颜色
  final GestureTapDownCallback onTapDown; // 点击事件
  Widget child; // 子视图

  final bool showArrow; // 是否显示右箭头， true: 显示， 默认 false: 不显示
  final EdgeInsetsGeometry showArrowPadding; // 箭头内 padding. 只有 showArrow 为 true 才有效

  final bool dividerHidden; // 是否隐藏分割线，默认 false 不隐藏
  SDMMDividerStyle dividerStyle; // 分割线样式


  @override
  _SDMMRowState createState() => _SDMMRowState();
}

class _SDMMRowState extends State<SDMMRow> {

  @override
  Widget build(BuildContext context) {
    Widget current = widget.child;

    if (widget.dividerStyle == null) {
      widget.dividerStyle = SDMMDividerStyle(height: 1, thickness: 1, color: Colors.black38, indent: 0, endIndent: 0);
    }

    return GestureDetector(
      onTapDown: widget.onTapDown,
      child: Container(
        padding: widget.padding,
        color: widget.color,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(flex: 1, child: current,),
                widget.showArrow == false ? SizedBox() : Container(
                  padding: widget.showArrowPadding,
                  child: Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 15),
                ),
              ],
            ),
            widget.dividerHidden ? SizedBox() : Divider(
              height: widget.dividerStyle.height,
              thickness: widget.dividerStyle.thickness,
              indent: widget.dividerStyle.indent,
              endIndent: widget.dividerStyle.endIndent,
              color: widget.dividerStyle.color,
            ),
          ],
        ),
      ),
    );
  }
}
