import 'package:flutter/material.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({
    this.price = 0.0,
    this.showShoppingCartInfoPressed,
    this.payPressed,
  });

  final double price;
  // 显示购物车详情回调
  final VoidCallback showShoppingCartInfoPressed;
  // 支付回调
  final VoidCallback payPressed;

  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.orange,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: <Widget>[
          // 购物车图标
          Container(
            width: 56,
//            color: Colors.grey,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, left: 56 / 2),
                  color: Color(0xff333333),
                ),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Image.asset(
                    'static/img/gouwuche.png',
                    height: 56,
                  ),
                  onPressed: widget.showShoppingCartInfoPressed,
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  // 中间的价格
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Color(0xff333333),
                      height: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '共¥ ${widget.price}',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                  // 去支付
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 222, 26, 80),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(28.0),
                        bottomRight: Radius.circular(28.0))
                    ),
                    child: FlatButton(
                      child: Text('去支付', style: TextStyle(color: Colors.white, fontSize: 17),),
                      onPressed: widget.payPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
