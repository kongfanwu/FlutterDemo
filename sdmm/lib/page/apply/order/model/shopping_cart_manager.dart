import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:sdmm/page/apply/order/model/goods_model.dart';

/// 购物车管理者
class ShoppingCartManager with ChangeNotifier {
  var _goodsList = <GoodsModel>[];
  var allPrice = 0.0;

  void add(GoodsModel goodsModel) {
    if (!_goodsList.contains(goodsModel)) {
      _goodsList.add(goodsModel);
    }
    // 可能会改变购买数量。都要计算
    computeAllPrice();
  }

  /// 计算价格
  void computeAllPrice() {
    allPrice = 0.0;
    _goodsList.forEach((element) {
      allPrice += double.parse(element.price) * element.buyCount;
    });
    notifyListeners(); // 发布更新通知
  }
}