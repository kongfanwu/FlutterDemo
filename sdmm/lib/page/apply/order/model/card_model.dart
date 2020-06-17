// 各种卡 model

import 'package:json_annotation/json_annotation.dart';
import './goods_model.dart';
import 'order_basic_types.dart';
/*
一次性生成命令：flutter packages pub run build_runner build
持续生成命令：flutter packages pub run build_runner watch
* * */

/*
 {
    "stored_card": [
        {
            "id": 10311,
            "money": "9454.00",
            "stored_code": "ST00000N",
            "name": "10000储值卡",
            "pro_list": [
                {
                    "pro_code": "PR00006O",
                    "name": "肩背通（新）",
                    "shichang": 40,
                    "price": "266"
                },
            ],
            "goods_list": [
                {
                    "goods_code": "GD00002D",
                    "name": "产品333",
                    "shichang": "100",
                    "price": "150"
                },
            ]
        }
    ],
    "card_num": [
        {
            "id": 1341,
            "card_num_code": "KN000008",
            "num": 48,
            "name": "20000元小光电卡",
            "pro_list": [
                {
                    "pro_code": "PR00006N",
                    "name": "肤质（新）",
                    "shichang": 90,
                    "price": "416.67",
                    "max_num": 20,
                    "limit": 1
                }
            ],
            "goods_list": [
                {
                    "goods_code": "GD00002C",
                    "name": "DA爱乳套",
                    "shichang": "60",
                    "price": "416.67",
                    "max_num": 1,
                    "limit": 1
                },
            ]
        }
    ],
    "card_time": [
        {
            "id": 1038,
            "card_time_code": "KT00001E",
            "end_time": "2021-03-11 11:23:16",
            "name": "7店专属时间卡",
            "price": "1666.67",
            "num": 6,
            "pro_list": [
                {
                    "pro_code": "PR00006O",
                    "name": "肩背通（新）",
                    "shichang": 40,
                    "price": "1666.67"
                }
            ],
            "goods_list": [
                {
                    "goods_code": "GD00002C",
                    "name": "DA爱乳套",
                    "shichang": "60",
                    "price": "1666.67"
                }
            ]
        }
    ]
}
*/

// goods_model.g.dart 将在我们运行生成命令后自动生成
part 'card_model.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class CardModel {
  CardModel(this.id, this.name, this.money, this.stored_code, this.card_num_code, this.card_time_code, this.end_time, this.price, this.num, this.goods_list, this.pro_list);

  int id;
  String name;
  String money;
  String stored_code;
  String card_num_code;
  String card_time_code;
  String end_time;
  String price;
  int num;
  List <GoodsModel> goods_list;
  List <GoodsModel> pro_list;

  // 服务类型
  ServiceType serviceType;
  // 卡类型
  CardType cardType;

  //不同的类使用不同的mixin即可
  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}