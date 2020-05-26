import 'package:flutter/material.dart';
import 'package:sdmm/public/item_model.dart';

class OrderManager extends StatefulWidget {
  OrderManager({this.navBarTitle});
  final String navBarTitle;
  @override
  _OrderManagerState createState() => _OrderManagerState();
}

class _OrderManagerState extends State<OrderManager> {
  List<ItemModel> _dataList = new List();
  ScrollController _controller = new ScrollController();

  void itemOnTap(ItemModel itemModel) {
    print(itemModel.title);
//    if (itemModel.id == '1') {
//      Navigator.of(context).push(
//        new MaterialPageRoute(
//          builder: (context) {
//            return OrderManager(
//              navBarTitle: itemModel.title,
//            ); // push
//          },
//        ),
//      );
//    }
  }

  Widget createItemWidget(ItemModel itemModel) {
    return GestureDetector(
      onTap: () {
        itemOnTap(itemModel);
      },
      child: Container(
//        width: 100,
//        height: 100,
//      color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              itemModel.imageName,
              fit: BoxFit.cover,
              width: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Text(itemModel.title),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 8; i++) {
      _dataList.add(ItemModel(
          id: i.toString(),
          title: '服务制单$i',
          imageName: 'static/img/xiaoshouzhidan.png'));
    }
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: Container(
        color: Color.fromARGB(255, 242, 242, 242),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GridView.builder(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: _dataList.length.toDouble(),
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.2, // 子控件宽高比。
                        ),
                        itemCount: _dataList.length,
                        itemBuilder: (context, index) {
                          return createItemWidget(_dataList[index]);
                        }),
                  ),
                  Container(
                    height: 10,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
