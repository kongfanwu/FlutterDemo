import 'package:flutter/material.dart';
import 'package:sdmm/public/tool_model.dart';
import 'select_user.dart';
import 'service_order.dart';
import 'sale_order.dart';
import 'package:provider/provider.dart';
import 'package:sdmm/model/user_model.dart';
import './model/customer_model.dart';

class OrderManager extends StatefulWidget {
  OrderManager({this.navBarTitle});
  final String navBarTitle;
  @override
  _OrderManagerState createState() => _OrderManagerState();
}

class _OrderManagerState extends State<OrderManager> {
  List<ItemModel> _dataList = new List();
  ScrollController _controller = new ScrollController();
  double _left = 0;

  void itemOnTap(ItemModel itemModel) async {
    print(itemModel.title);
    if (itemModel.id == '0') {
      // push 到选择顾客，并等待返回选中的顾客 customerModel
      final CustomerModel customerModel = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SelectUser(
              navBarTitle: '搜索顾客',
            ); // push
          },
        ),
      );
      if (customerModel != null) {
        // 接收到选中的顾客model. push 到 服务单路由
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) {
              return ServiceOrder(
                navBarTitle: '服务订单',
                customerModel: customerModel,
              ); // push
            },
          ),
        );
      }
    } else if (itemModel.id == '1') {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            return SaleOrder(
              navBarTitle: '销售订单',
            ); // push
          },
        ),
      );
    }
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
      if (i == 1) {
        _dataList.add(ItemModel(
            id: i.toString(),
            title: '销售制单$i',
            imageName: 'static/img/xiaoshouzhidan.png'));
      } else {
        _dataList.add(ItemModel(
            id: i.toString(),
            title: '服务制单$i',
            imageName: 'static/img/xiaoshouzhidan.png'));
      }
    }
    _controller.addListener(() {
//      ScrollPositionWithSingleContext#fb2d8(offset: 315.0, range: 0.0..315.0, viewport: 355.0, ScrollableState, BouncingScrollPhysics, IdleScrollActivity#c6972, ScrollDirection.idle)
      ScrollPositionWithSingleContext pos = _controller.position;
      // pos.viewportDimension 显示视口大小
      // pos.pixels 当前便宜位置
      // pos.maxScrollExtent 可偏移最大数
      double scale = pos.pixels / pos.maxScrollExtent;
      setState(() {
        _left = (150 - 50) * scale;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//  print('Apply1-----------${context.read<UserModel>().name}'); // NO
//  print('Apply2-----------${context.watch<UserModel>().name}'); // OK
//  print('Apply3--------${Provider.of<UserModel>(context, listen: true).name}'); // OK
//  print('Apply4---------${context.select((UserModel p) => p.name)}'); // OK

//    return Consumer2<ChangeNotifierProvider, UserModel>(
//      builder: (BuildContext context, ChangeNotifierProvider pro, UserModel userModel, _) {
//      print(userModel.name);
//      return Text(userModel.name);
//    });

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
//                    color: Colors.red,
                    child: Stack(
                      alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(seconds: 0),
                          left: _left,
                          child: Container(
                            height: 10,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        )
                      ],
                    ),
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
