import 'package:flutter/material.dart';

class SwitchAndCheckboxComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SwitchAndCheckboxComponent();
  }

}

class _SwitchAndCheckboxComponent extends State<SwitchAndCheckboxComponent> {
  var _switchVal = false;
  var _checkboxVal = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Switch(
          value: _switchVal,
          onChanged: (val){
            setState(() {
              this._switchVal = val;
            });
          },

        ),
        Checkbox(
          value: _checkboxVal,
          onChanged: (val){
            setState(() {
              this._checkboxVal = val;
            });
          },
        )
      ],
    );
  }

}