import 'package:flutter/material.dart';
import 'package:sdmm/public/tool_model.dart';
import './model/goods_model.dart';
import './model/card_model.dart';

class OrderScaffold extends StatefulWidget {
  OrderScaffold({this.dataList});
  final List<CardItemModel> dataList;
  @override
  _OrderScaffoldState createState() => _OrderScaffoldState();
}

class _OrderScaffoldState extends State<OrderScaffold> {
  // 当前索引
  IndexPath _currentIndexPath;

  @override
  void initState() {
    super.initState();

    //寻找默认索引
    for (int i = 0; i < widget.dataList.length; i++) {
      int section = 0;
      int row = -1;
      final itemModel = widget.dataList[i];
      if (itemModel.select) {
        section = i;
        if (itemModel.children != null && itemModel.children.length > 0) {
          for (int j = 0; j < itemModel.children.length; j++) {
            final childItemModel = itemModel.children[j];
            if (childItemModel.select) {
              row = j;
              _currentIndexPath = IndexPath(section, row);
              break;
            }
          }
        } else {
          _currentIndexPath = IndexPath(section, row);
          break;
        }
      }
    }
    print('_currentIndexPath:section=${_currentIndexPath.section} row=${_currentIndexPath.row}');
  }

  @override
  Widget build(BuildContext context) {
    // 寻找选中的 content widget
    Widget contentWidget;
    final sectionItemModel = widget.dataList[_currentIndexPath.section];
    if (_currentIndexPath.row > -1) {
      final rowItemModel = sectionItemModel.children[_currentIndexPath.row];
      contentWidget = rowItemModel.child;
    } else {
      contentWidget = sectionItemModel.child;
    }
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            color: Color.fromARGB(255, 242, 242, 242),
            width: 100,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return CardItemWidget(
                        itemModel: widget.dataList[index],
                        section: index,
                        onTap: itemOnTap,
                      );
                    },
                    itemCount: widget.dataList.length,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(child: contentWidget,),
//              child: IndexedStack(
//                index: _index,
//                children: _dataList.map((e) => e.child).toList(),
//              ),
          ),
        ],
      ),
    );
  }

  void itemOnTap(IndexPath indexPath) {
    print('onTap:section=${indexPath.section} row=${indexPath.row}');
    for (int i = 0; i < widget.dataList.length; i++) {
      final itemModel = widget.dataList[i];
      // 将点击的 section 设置为 true 其他设置为 false
      if (i == indexPath.section) {
        itemModel.select = true;
        if (indexPath.row > -1) {
          // 将点击的 row 设置为 true 其他设置为 false
          for (int j = 0; j < itemModel.children.length; j++) {
            final childItemModel = itemModel.children[j];
            if (j == indexPath.row) {
              childItemModel.select = true;
            } else {
              childItemModel.select = false;
            }
          }
        }
      } else {
        itemModel.select = false;
      }
    }
    _currentIndexPath = indexPath;
    setState(() {});
  }
}


typedef CardItemWidgetTapCallback = void Function(IndexPath indexPath);

class CardItemWidget extends StatefulWidget {
  CardItemWidget({this.itemModel, this.section, this.onTap});
  final CardItemModel itemModel;
  final int section;
  final CardItemWidgetTapCallback onTap;

  @override
  _CardItemWidgetState createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  /* 创建item */
  Widget createItem(CardItemWidgetTapCallback onTap) {
    final itemModel = widget.itemModel;
    final bgColor =
    itemModel.select ? Colors.white : Color.fromARGB(255, 242, 242, 242);
    final textColor =
    itemModel.select ? Colors.red : Color.fromARGB(255, 51, 51, 51);
    return GestureDetector(
      onTap: () {
        onTap(IndexPath(widget.section, -1));
      },
      child: Container(
        height: 44,
        color: bgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            itemModel.select
                ? Container(
              width: 3,
              height: 15,
              color: Colors.red,
            )
                : SizedBox(width: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  itemModel.title,
                  style: TextStyle(
                      color: textColor, fontSize: itemModel.select ? 16 : 14),
                ),
                itemModel.children == null
                    ? SizedBox(width: 23)
                    : Icon(itemModel.select
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /* 创建子类化的 item */
  List<Widget> childrenItems(
      CardItemModel itemModel, CardItemWidgetTapCallback onTap) {
    List<CardItemModel> childrenlModel = itemModel.children;
    List<Widget> items = new List();

    // 创建带有子 row 的 section. 并且点击默认 row 为 0.
    items.add(createItem((IndexPath indexPath){
      onTap(IndexPath(indexPath.section, 0));
    }));

    if (itemModel.select) {
      for (int i = 0; i < childrenlModel.length; i++) {
        final itemModel = childrenlModel[i];
        final textColor = itemModel.select ? Colors.red : Color.fromARGB(255, 51, 51, 51);
        items.add(GestureDetector(
          onTap: () {
            onTap(IndexPath(widget.section, i));
          },
          child: Container(
            color: Colors.white,
            height: 44,
            child: Center(
              child: Text(
                itemModel.title,
                style: TextStyle(
                    color: textColor,
                    fontSize: itemModel.select ? 14 : 12),
              ),
            ),
          ),
        ));
      }
    }
    return items;
  }

  /* 创建有子类的 item */
  Widget createChildrenItem(CardItemWidgetTapCallback onTap) {
    final itemModel = widget.itemModel;
    return Column(
      children: childrenItems(itemModel, onTap),
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemModel = widget.itemModel;
    return itemModel.children == null
        ? createItem(widget.onTap)
        : createChildrenItem(widget.onTap);
  }
}

/* 各种卡 item model */
class CardItemModel {
  CardItemModel({this.title, this.select = false, this.goods_list, this.cardModel, this.children, this.child});
  String title;
  bool select;
  List<CardItemModel> children;
  // 一级目录。如 处方、产品、项目 下的产品集合
  List <GoodsModel> goods_list;
  // 二级目录的卡Model
  CardModel cardModel;
  Widget child;
}