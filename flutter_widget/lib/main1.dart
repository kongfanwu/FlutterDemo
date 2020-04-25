import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'hai title',
      home: TutorialHome(),
    )

  );
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(Icons.search),
          tooltip: 'Search',
          onPressed: (){
            print('IconButton');
          },
        ),
        title: Text('title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: MyButton(),
      ),
    );
  }

}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: (){
        print('MyButton Click');
      },
      child: new Container(
        height: 36,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(18),
          color: Colors.lightGreen[500]
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}