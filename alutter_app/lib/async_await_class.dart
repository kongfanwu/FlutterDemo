
import 'package:flutter/material.dart';

class AsyncAwaitClass extends StatelessWidget {

  final oneSecond = Duration(seconds: 1);

  Future<String> printWithDelay(String message) async {
    await Future.delayed(oneSecond, (){
      return message;
    });
    print(message);
  }

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  void printTest(String message) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    print('-----');
    Future result = printWithDelay('1');
    printTest('test');
    print('+++++');

//    printWithDelay2('2');
    return Container(child: SizedBox(),);
  }
}
