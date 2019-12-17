import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickerActionBar extends StatelessWidget {
  final VoidCallback cancel;
  final VoidCallback confirm;
  final VoidCallback selectNone;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: cancel,
          child: Text("取消",
              style: TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 102, 102, 102))),
        ),
        Text(
          "请选择",
          style:
              TextStyle(fontSize: 15, color: Color.fromARGB(255, 54, 54, 54)),
        ),
        Row(
          children: <Widget>[
            InkWell(
              onTap: selectNone,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 3, 8, 3),
                child: Text(
                  "全不选",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 102, 102, 102)),
                ),
              ),
            ),
            InkWell(
              onTap: confirm,
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 3, 16, 3),
                child: Text(
                  "确认",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 245, 171, 63)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  PickerActionBar({this.confirm, this.cancel, this.selectNone});
}
