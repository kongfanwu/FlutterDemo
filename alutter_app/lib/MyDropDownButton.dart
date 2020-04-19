import 'package:flutter/material.dart';

class MyDropDownButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyDropDownBUtton();
  }
  
}

class _MyDropDownBUtton extends State<MyDropDownButton> {
  List getCityList() {
    List<DropdownMenuItem> cityList = new List();
    cityList.add(DropdownMenuItem(child: new Text('上海'), value: 'shanghai'));
    cityList.add(DropdownMenuItem(child: new Text('北京'), value: 'beijing'));
    cityList.add(DropdownMenuItem(child: new Text('广州'), value: 'guangzhou'));
    cityList.add(DropdownMenuItem(child: new Text('深圳'), value: 'shenzhen'));
    return cityList;
  }

  // 创建选中的变量
  var selectedCity;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new DropdownButton(
            items: getCityList(), // 调用方法，获取item数据
            hint: new Text('请选择城市'), // 提示信息
            value: selectedCity, // 将选中的item赋值给 DropdownButton 显示
            onChanged: (val) { // 选择事件，val 是选择的值
              // 把值存到状态里，并且页面刷新
              setState(() {
                this.selectedCity = val;
              });
            }
        )
      ],
    );
  }
  
}