library flutter_loading;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_loading/loading_container.dart';
import 'package:flutter_loading/loading_controller.dart';
//import 'package:flutter_loading/flutter_loading.dart';

/* State 对象混入此类，即可拥有 loading 能力
使用示例
// 1
class _ServiceOrderState extends State<ServiceOrder> with XMHLoadingStateMixin {
@override
  Widget build(BuildContext context) {
    // 2
    return buildLoadingContainer(
    child: null,
    );
  }

  // 3
  // 等待请求完成，并加载loading
  void getData1() async {
    await loading(getData());
  }
  // 请求数据
  getData {

  }
}
* */

mixin XMHLoadingStateMixin<T extends StatefulWidget> on State<T> {
  final LoadingController loadingController = LoadingController();

  @override
  void dispose() {
    loadingController.dispose();
    super.dispose();
  }

  loading(Future f) {
    return loadingController.loading(f);
  }

  Widget buildLoadingBody() {
    return Container(
      color: Colors.black45,
      child: Center(
        child: Image.asset(
          'static/img/xmhLoading.gif',
          fit: BoxFit.cover,
          width: 80,
          height: 80,
        ),
      ),
    );
  }

  LoadingContainer buildLoadingContainer({@required Widget child}) {
    return LoadingContainer(
        child: child,
        controller: loadingController,
        loadingBody: buildLoadingBody());
  }
}
