import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerActionBar extends StatelessWidget {
  final VoidCallback cancel;
  final VoidCallback confirm;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: cancel,
          child: Text("取消"),
        ),
        Text("请选择"),
        FlatButton(
          onPressed: confirm,
          child: Text("确认"),
        ),
      ],
    );
  }

  PickerActionBar({
    this.confirm,
    this.cancel,
  });
}
