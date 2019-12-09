import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multi_picker/bean/picker_item.dart';

typedef List<Widget> CreateWidgetList();

class PickerListWidget extends StatefulWidget {
  final ValueChanged<int> onSelectedItemChanged;
  final FixedExtentScrollController scrollController;
  final CreateWidgetList createWidgetList;
  final Key key;

  PickerListWidget(
      {this.key,
      this.onSelectedItemChanged,
      this.scrollController,
      this.createWidgetList});

  @override
  State<StatefulWidget> createState() => _PickerListWidgetState();
}

class _PickerListWidgetState extends State<PickerListWidget> {
  static const double _ITEM_HEIGHT = 40;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      key: this.widget.key,
      itemExtent: _ITEM_HEIGHT,
      scrollController: this.widget.scrollController,
      children: widget.createWidgetList().length > 0
          ? widget.createWidgetList()
          : [
              Center(
                child: Text('请选择'),
              )
            ],
      onSelectedItemChanged: this.widget.onSelectedItemChanged,
    );
  }
}
