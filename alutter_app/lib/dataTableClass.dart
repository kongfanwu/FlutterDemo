import 'package:flutter/material.dart';

class User {
  User(this.name, this.age, this.aaa, this.year, this.month, {this.selected = false});

  String name;
  int age;
  bool selected;
  String aaa;
  String month;
  String year;
}

// ignore: camel_case_types
class dataTableClass extends StatefulWidget {
  @override
  _dataTableClassState createState() => _dataTableClassState();
}

// ignore: camel_case_types
class _dataTableClassState extends State<dataTableClass> {
  var _sortAscending = true;

  List<User> data = [
    User('老孟', 1, '男',  '1990', '5'),
    User('老孟', 2, '男',  '1990', '5'),
    User('老孟', 3, '男',  '1990', '5'),
    User('老孟', 4, '男',  '1990', '5'),
    User('老孟', 5, '男',  '1990', '5'),
    User('老孟', 6, '男',  '1990', '5'),
    User('老孟', 7, '男',  '1990', '5',selected: true),
  ];

  @override
  Widget build(BuildContext context) {

    List<DataRow> dateRows = [];
    for (int i = 0; i < data.length; i++) {
      dateRows.add(DataRow(
        selected: data[i].selected,
        onSelectChanged: (selected){
          setState(() {
            data[i].selected = selected;
          });
        },
        cells: [
          DataCell(Text('${data[i].name}'),
              showEditIcon: true, // 编辑图标
              onTap: (){ // 编辑点击
                print('DataCell onTap');
              },
//              placeholder: true // 灰色显示
          ),
          DataCell(Text('${data[i].age}')),
          DataCell(Text('${data[i].aaa}')),
          DataCell(Text('${data[i].year}')),
          DataCell(Text('${data[i].month}')),
        ],
      ));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          sortColumnIndex: 1,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(label: Text('姓名')),
            DataColumn(
                label: Text('年龄'),
                onSort: (int columnIndex, bool ascending){
                  setState(() {
                    _sortAscending = ascending;
                    if(ascending){
                      data.sort((a, b) => a.age.compareTo(b.age));
                    }else {
                      data.sort((a, b) => b.age.compareTo(a.age));
                    }
                  });
                }
            ),
            DataColumn(label: Text('性别')),
            DataColumn(label: Text('出生年份')),
            DataColumn(label: Text('出生月份')),
          ], rows: dateRows),
    );



//    return DataTable(
//      sortColumnIndex: 1,
//      sortAscending: true, // 表头显示排序图标：
//      columns: [
//        DataColumn(label: Text('姓名'), tooltip: '长按提示'),
//        DataColumn(
//            label: Text('年龄'),
//            numeric: true, // 右对齐
//            onSort: (int columnIndex, bool ascending){
//              //排序算法
//            }
//        ),
//      ],
//      rows: [
//        DataRow(
//          selected: true, // 行被选中
//          cells: [
//          DataCell(Text('孔')),
//          DataCell(Text('18')),
//        ],
//          onSelectChanged: (selected){
//          },
//        ),
//        DataRow(
//            selected: false,
//            cells: [
//              DataCell(Text('孔')),
//              DataCell(Text('18')),
//            ]),
//      ],
//    );
  }
}


