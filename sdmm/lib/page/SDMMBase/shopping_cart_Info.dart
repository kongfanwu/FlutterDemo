import 'package:flui/flui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/page/SDMMBase/number_view.dart';
import 'package:sdmm/page/apply/order/model/shopping_cart_manager.dart';

/// 购物车详情
class ShoppingCartInfo extends StatefulWidget {
  ShoppingCartInfo({
    this.onRemovePressed,
    this.changeNumberPressed,
  });

  // 移除视图事件回调
  final VoidCallback onRemovePressed;
  final VoidCallback changeNumberPressed;

  @override
  _ShoppingCartInfoState createState() => _ShoppingCartInfoState();
}

class _ShoppingCartInfoState extends State<ShoppingCartInfo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onRemovePressed,
      child: Container(
          color: Color.fromARGB(76, 0, 0, 0),
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height - 316), // 减去下部购物车视图高度
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              bottom: 105,
            ), // 减去下部购物车视图高度
            child: Container(
              child: Column(
                children: <Widget>[
                  createHeaderWidget(),
                  Expanded(
                    child: createListWidget(),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  // 头部视图
  Widget createHeaderWidget() {
    return Container(
      color: Color.fromARGB(255, 247, 247, 247),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '  已选商品',
            style: TextStyle(color: Color(0xff999999), fontSize: 16),
          ),
          Container(
            width: 60,
            child: FlatButton(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.delete_outline,
                    size: 17,
                    color: Colors.red,
                  ),
                  Text(
                    '清空',
                    style: TextStyle(color: Color(0xff666666), fontSize: 15),
                  ),
                ],
              ),
              onPressed: () {
                print('清空');
              },
            ),
          ),
        ],
      ),
    );
  }

  // 列表视图
  Widget createListWidget() {
    // 获取购物车管理者
    final shoppingCartManager = Provider.of<ShoppingCartManager>(context, listen: false);

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        TextEditingController _numberViewController = TextEditingController();
        final goodsModel = shoppingCartManager.goodsList[index];
        return Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(goodsModel.name),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: NumberView(
                value: goodsModel.buyCount,
                controller: _numberViewController,
                onChanged: (val) {
                  // 更改购买数量
                  int buyCount = int.parse(val);
                  // 假定最大可购买数量为5，超过5 添加失败
                  if (buyCount > 5) {
                    _numberViewController.text = (--buyCount).toString();
                    FLToast.showText(text:'最多只能添加5个');
                    return;
                  }
                  goodsModel.buyCount = buyCount;
                  // 回调
                  widget.changeNumberPressed();
                  // 更新购物车价格
                  shoppingCartManager.add(goodsModel);

                },
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.black12,
          height: 1,
          thickness: 1,
        );
      },
      itemCount: shoppingCartManager.goodsList.length,
    );
  }
}
