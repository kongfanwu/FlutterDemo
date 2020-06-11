// 从一个页面回传数据

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Returning Data Demo'),
      ),
      // Create the SelectionButton widget in the next step.
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('传递参数到下一页，并接受返回参数'),
    );
  }

  // A method that launches the SelectionScreen and awaits the
  // result from Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(
        builder: (context) => SelectionScreen(),
        settings: RouteSettings( // 传递参数到下一页
          name: 'name 传递的参数1',
          arguments: 'arguments 传递的参数2',
        ),
      ),
    );
    // 等选择界面返回结果，先隐藏之前的 snackbars，结果显示在新的 snackbars 里  (After the Selection Screen returns a result, hide any previous snackbars and show the new result!)
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result'),));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // 从路由中获取上页传递的数据
    final name = ModalRoute.of(context).settings.name;
    final arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$name\n$arguments'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Yep" (Pop here with "Yep"...)
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // 在这里返回 "Nope" (Pop here with "Nope")
                  Navigator.pop(context, 'Nope!');
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}