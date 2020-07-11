import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:sdmm/page/apply/order/model/goods_model.dart';

/// 购物车管理者
class ShoppingCartManager with ChangeNotifier {
  var goodsList = <GoodsModel>[];
  var allPrice = 0.0;

  void add(GoodsModel goodsModel) {
    if (!goodsList.contains(goodsModel)) {
      goodsList.add(goodsModel);
    }
    // 可能会改变购买数量。都要计算
    computeAllPrice();
  }

  /// 计算价格
  void computeAllPrice() {
    allPrice = 0.0;
    goodsList.forEach((element) {
      allPrice += double.parse(element.price) * element.buyCount;
    });
    notifyListeners(); // 发布更新通知
  }

  /// 清空管理者数据
  void clear() {
    if (goodsList.length > 0) {
      goodsList.removeRange(0, goodsList.length - 1);
    }
    allPrice = 0.0;
  }
}