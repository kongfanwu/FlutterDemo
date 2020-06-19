// 产品 项目model

import 'package:json_annotation/json_annotation.dart';
import 'order_basic_types.dart';

/*
一次性生成命令：flutter packages pub run build_runner build
持续生成命令：flutter packages pub run build_runner watch
* * */

/*
 项目数据 v5.serv/pro
"id": 67182,
"pro_code": "PR00006O",
"num": 1,
"shichang": 40,
"name": "肩背通（新）",
"is_new": 0,
"price": "380"

提卡-任选卡项目
"pro_code": "PR00006N",
"name": "肤质（新）",
"shichang": 90,
"price": "416.67",
"max_num": 20,
"limit": 1

提卡-产品
"goods_code": "GD00002C",
"name": "DA爱乳套",
"shichang": "60",
"price": "416.67",
"max_num": 1,
"limit": 1
*/

// goods_model.g.dart 将在我们运行生成命令后自动生成
part 'goods_model.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class GoodsModel {
  GoodsModel(this.id, this.name, this.pro_code, this.num, this.shichang, this.is_new, this.price, this.max_num, this.limit, this.goods_code);

  int id;
  String name;
  String pro_code;
  int num;
  var shichang;
  int is_new;
  String price;

  int max_num;
  int limit;

  String goods_code;

  // 服务类型
  ServiceType serviceType;
  // 卡类型
  CardType cardType;
  // 购买数量
  int buyCount = 0;

  //不同的类使用不同的mixin即可
  factory GoodsModel.fromJson(Map<String, dynamic> json) => _$GoodsModelFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsModelToJson(this);
}