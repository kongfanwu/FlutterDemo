import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user_model.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class UserModel with ChangeNotifier  {
  UserModel(this.id, this.manage_type, this.name, this.phone, this.password, this.token, this.join_code, this.isLogin);

  int id;
  int manage_type;
  String name;
  String phone;
  String password;
  String token;
  List <JoinModel> join_code;
  bool isLogin;

  String getJoinCode() {
    return join_code.first.code;
  }

  //不同的类使用不同的mixin即可
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  void setIsLogin(bool isLogin) {
    this.isLogin = isLogin;
    notifyListeners(); // 发布更新通知
  }
}

@JsonSerializable()
class JoinModel with ChangeNotifier {
  JoinModel(this.code, this.name, this.join_logo, this.fram_id, this.function_id, this.fram_name_id, this.store_code, this.framework_function_name, this.framework_function_main_role);

  String code;
  String name;
  String join_logo;
  var fram_id;
  int function_id;
  int fram_name_id;
  String store_code;
  String fram_id_name;
  String framework_function_name;
  int framework_function_main_role;
  //不同的类使用不同的mixin即可
  factory JoinModel.fromJson(Map<String, dynamic> json) => _$JoinModelFromJson(json);
  Map<String, dynamic> toJson() => _$JoinModelToJson(this);
}

/*
{
    "code": 1,
    "msg": "ok",
    "data": {
        "id": 821,
        "manage_type": 1,
        "manage_val": [
            ""
        ],
        "account": "18600004444",
        "name": "建国门前台",
        "phone": "18600004444",
        "head_img": "http://xmh.images.ourjb.com/uploads/sign/5df0b4dddc1c9.png",
        "skill_level": 2,
        "password": "21218cca77804d2ba1922c33e0151105",
        "join_code": [
            {
                "code": "SJ00002L",
                "name": "智能检索商家",
                "join_logo": "",
                "fram_id": "1018",
                "function_id": 194,
                "fram_name_id": 104,
                "join_state": 0,
                "fram_list": [
                    {
                        "fram_name_id": 104,
                        "name": "门店",
                        "level": 0,
                        "main_role": 7
                    },
                    {
                        "fram_name_id": 105,
                        "name": "员工",
                        "level": -1,
                        "main_role": 8
                    },
                    {
                        "fram_name_id": -1,
                        "name": "顾客",
                        "level": -100,
                        "main_role": -1
                    }
                ],
                "store_code": "MD00004C",
                "fram_id_name": "建国门前台",
                "fram_id_level": 0,
                "fram_id_subset": 0,
                "fram_id_is_observer": 1,
                "purview": [
                    "2"
                ],
                "framework_function_name": "前台",
                "framework_function_main_role": 7,
                "framework_function_role": [
                    "7"
                ]
            },
            {
                "code": "SJ000003",
                "name": "北京总部测试样板店",
                "join_logo": "http://images.ourjb.com/uploads/join/20180622/m_0e208c14acb11796cff37125276f0e5b.png",
                "fram_id": "795",
                "function_id": 57,
                "fram_name_id": 22,
                "join_state": 0,
                "fram_list": [
                    {
                        "fram_name_id": 22,
                        "name": "门店部",
                        "level": 0,
                        "main_role": 7
                    },
                    {
                        "fram_name_id": 24,
                        "name": "店长部",
                        "level": -1,
                        "main_role": 6
                    },
                    {
                        "fram_name_id": 25,
                        "name": "员工部",
                        "level": -2,
                        "main_role": 9
                    },
                    {
                        "fram_name_id": -1,
                        "name": "顾客",
                        "level": -100,
                        "main_role": -1
                    }
                ],
                "store_code": "MD000022",
                "fram_id_name": "北京总部测试门店1前台",
                "fram_id_level": 0,
                "fram_id_subset": 0,
                "fram_id_is_observer": 1,
                "purview": [
                    "2"
                ],
                "framework_function_name": "前台",
                "framework_function_main_role": 7,
                "framework_function_role": [
                    "7"
                ]
            }
        ],
        "token": "3e22c9e2ec42ca8ca8c313ddcbb6bfa8"
    }
}
 */