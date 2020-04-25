import 'package:flutter/material.dart';
class LoadingClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40,),
        LinearProgressIndicator(
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation(Colors.red),
          value: 0.5,
        ),
        SizedBox(height: 40,),
        CircularProgressIndicator(
          value: 0.3,
          backgroundColor: Colors.black12,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        )
      ],
    );
  }
}
