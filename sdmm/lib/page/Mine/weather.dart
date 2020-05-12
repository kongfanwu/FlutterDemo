import 'package:flutter/material.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:sdmm/page/Mine/model/weatherModel.dart';

class Weather extends StatefulWidget {
  Weather({this.navBarTitle});

  final String navBarTitle;

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  List<WeatherModel> dataList = new List();
  List<DropdownMenuItem> _dropdownDataList = new List();
  var _dropValue = '';

  void getData() {
    Map<String, String> queryParameters = {'citykey': _dropValue};
    DioManager.getInstance().get('http://wthrcdn.etouch.cn/weather_mini',
        params: queryParameters, successCallBack: (data) {
//      var modelList = (data['data']['forecast'] as List).map((e) => WeatherModel.fromJson(e)).toList();
      var modelList = (data['data']['forecast'] as List).map((e) {
        return WeatherModel.fromJson(e);
      }).toList();
      modelList.insert(0, WeatherModel.fromJson(data['data']['yesterday']));
      setState(() {
        dataList = modelList;
      });
    }, errorCallBack: (e) {
      print(e);
    });
  }

  void createDropdownDataList() {
    _dropdownDataList.add(DropdownMenuItem(child: Text('北京'), value: '101010100'));
    _dropdownDataList.add(DropdownMenuItem(child: Text('海淀'), value: '101010200'));
    _dropdownDataList.add(DropdownMenuItem(child: Text('朝阳'), value: '101010300'));
    _dropdownDataList.add(DropdownMenuItem(child: Text('顺义'), value: '101010400'));
    _dropdownDataList.add(DropdownMenuItem(child: Text('怀柔'), value: '101010500'));
    _dropdownDataList.add(DropdownMenuItem(child: Text('通州'), value: '101010600'));
    _dropdownDataList.add(DropdownMenuItem(child: Text('昌平'), value: '101010700'));
    _dropdownDataList.add(DropdownMenuItem(child: Text('延庆'), value: '101010800'));

    _dropValue = _dropdownDataList.first.value;
  }

  @override
  void initState() {
    // TODO: implement initState
    createDropdownDataList();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
        actions: <Widget>[
          DropdownButton(
            focusColor: Colors.orange,
            iconDisabledColor:Colors.white,
            iconEnabledColor: Colors.white,
//            style: TextStyle(color: Colors.white, decorationColor: Colors.orange, backgroundColor: Colors.black),
            value: _dropValue,
            items: _dropdownDataList,
            onChanged: (value) {
              _dropValue = value;
              getData();
            },
          )
        ],
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final model = dataList[index];
            return Text(model.date +
                '   ' +
                model.high +
                '   ' +
                model.low +
                '   ' +
                model.type +
                '   ' +
                (model.fengxiang == null ? '' : model.fengxiang));
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 1,);
          },
          itemCount: dataList.length,
        ),
      ),
    );
  }
}
