import 'package:flutter/material.dart';

// ignore: camel_case_types
class dataTableClass extends StatefulWidget {
  @override
  _dataTableClassState createState() => _dataTableClassState();
}

// ignore: camel_case_types
class _dataTableClassState extends State<dataTableClass> {
  var _sortAscending = true;
  
  List<User> data = [
    User('老孟', 18),
    User('老孟1', 19,selected: true),
    User('老孟2', 20),
    User('老孟3', 21),
    User('老孟4', 22),
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
        ],
      ));
    }

    return DataTable(
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
    ], rows: dateRows);

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


class User {
  User(this.name, this.age, {this.selected = false});

  String name;
  int age;
  bool selected;
}