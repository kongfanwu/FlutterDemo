import 'package:flutter/material.dart';

class ServiceOrder extends StatefulWidget {
  ServiceOrder({this.navBarTitle});
  final String navBarTitle;
  @override
  _ServiceOrderState createState() => _ServiceOrderState();
}

class _ServiceOrderState extends State<ServiceOrder> {
  List <CardItemModel> _dataList = new List();
  // 当前索引
  var _index = 0;

  @override
  void initState() {
    super.initState();
    _dataList.add(CardItemModel(
      title: '处方服务',
      select: false,
      child: Container(color: Colors.primaries[0]),
    ));
    _dataList.add(CardItemModel(
      title: '提卡服务',
      child: Container(color: Colors.primaries[1]),
      children: [
        CardItemModel(
          title: '储值卡1',
          select: true,
          child: Container(color: Colors.primaries[0]),
        ),
        CardItemModel(
          title: '储值卡2',
          child: Container(color: Colors.primaries[1]),
        ),
      ],
    ));
    _dataList.add(CardItemModel(
      title: '项目服务',
      select: true,
      child: Container(color: Colors.primaries[2]),
    ));

     //寻找默认索引
    for (int i = 0; i < _dataList.length; i++) {
      if (_dataList[i].select) {
        _index = i;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: Container(
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
                            itemModel: _dataList[index],
                            onTap: () {
                              print('onTap=$index');
                              setState(() {
                                for (int i = 0; i < _dataList.length; i++) {
                                  _dataList[i].select = i == index;
                                  if (i == index) {
                                    _dataList[i].select = true;
                                  }
                                }
                                _index = index;
                              });
                            },
                          );
                        },
                      itemCount: _dataList.length,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IndexedStack(
                index: _index,
                children: _dataList.map((e) => e.child).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItemWidget extends StatefulWidget {
  CardItemWidget({this.itemModel, this.onTap});
  final CardItemModel itemModel;
  final GestureTapCallback onTap;

  @override
  _CardItemWidgetState createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  /* 创建item */
  Widget createItem() {
    final itemModel = widget.itemModel;
    final bgColor = itemModel.select ? Colors.white : Color.fromARGB(255, 242, 242, 242);
    final textColor = itemModel.select ? Colors.red : Color.fromARGB(255, 51, 51, 51);
    return Container(
      height: 44,
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          itemModel.select ? Container(width: 3, height: 15, color: Colors.red,) : SizedBox(width: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(itemModel.title, style: TextStyle(color: textColor, fontSize: itemModel.select ? 16 : 14),),
              itemModel.children == null ?
              SizedBox(width: 23) :
              Icon(itemModel.select ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
            ],
          ),
        ],
      ),
    );
  }

  /* 创建子类化的 item */
  List <Widget> childrenItems (CardItemModel itemModel) {
    List <CardItemModel> childrenlModel = itemModel.children;
    List <Widget> items = new List();
    items.add(createItem());

    if (itemModel.select) {
      for (int i = 0; i < childrenlModel.length; i++) {
        final itemModel = childrenlModel[i];
        final textColor = itemModel.select ? Colors.red : Color.fromARGB(255, 51, 51, 51);
        items.add(Container(
          color: Colors.white,
          height: 44,
          child: Center(child: Text(itemModel.title, style: TextStyle(color: textColor, fontSize: itemModel.select ? 16 : 14),),),
        ),);
      }
    }
    return items;
  }

  /* 创建有子类的 item */
  Widget createChildrenItem() {
    final itemModel = widget.itemModel;
    return Column(children: childrenItems(itemModel),);
  }

  @override
  Widget build(BuildContext context) {
    final itemModel = widget.itemModel;
    return GestureDetector(
      onTap: widget.onTap,
      child: itemModel.children == null ? createItem() : createChildrenItem(),
    );
  }
}

/* 各种卡 item model */
class CardItemModel {
  CardItemModel({this.title, this.select = false, this.children, this.child});
  String title;
  bool select;
  List <CardItemModel> children;
  Widget child;
}