import 'package:alutter_app/stateZhouQi.dart';
import 'package:flutter/material.dart';
import 'package:alutter_app/TextClass.dart';
import 'package:alutter_app/ButtonClass.dart';
//import 'package:alutter_app/ImageClass.dart';
import 'ImageClass.dart';
import 'MyDropDownButton.dart';
import 'SwitchAndCheckboxComponent.dart';
import 'TextFiedlClass.dart';
import 'FormClass.dart';
import 'ExpandedClass.dart';
import 'AlertDialogClass.dart';
import 'Align_CenterClass.dart';
import 'Column_RowClass.dart';
import 'ContainersClass.dart';
import 'LoadingClass.dart';
import 'GridViewClass.dart';
import 'StackClass.dart';
import 'dataTableClass.dart';
import 'wrap_flow.dart';
import 'listViewLoading.dart';
import 'inheritedWidgetDemo.dart';
import 'package:alutter_app/providerDemo/providerClass.dart';
import 'futureBuilderClass.dart';
import 'package:alutter_app/custom_widgets/gradient_button.dart';
import 'future_builder_class.dart';
import 'provider_demo/provider_app.dart';
import 'provider_demo/provider_app2.dart';
import 'animation_class.dart';
import 'animated_widgets_test.dart';
import 'async_await_class.dart';

//void main() => runApp(MyApp());
void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    void onTap() {
      print('print');
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FWFutureBuilder(),
    );
  }
}

