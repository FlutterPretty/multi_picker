import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multi_picker/bean/picker_item.dart';

class PickerListWidget extends StatelessWidget {
  final List<PickerItem> data;
  final ValueChanged<int> onSelectedItemChanged;
  final FixedExtentScrollController scrollController;
  final Key key;
  static const double _ITEM_HEIGHT = 40;

  PickerListWidget(
      {this.key, this.data, this.onSelectedItemChanged, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      key: key,
      itemExtent: _ITEM_HEIGHT,
      scrollController: scrollController,
      children: _buildItems(),
      onSelectedItemChanged: this.onSelectedItemChanged,
    );
  }

  List<Widget> _buildItems() {
    List<Widget> widgets = [];
    if (data.length == 0 || data[0].showTitle != "请选择") {
      data.insert(0, PickerItem("请选择"));
    }

    widgets.addAll(data.map((PickerItem item) {
      return _singleItemDisplay(item);
    }).toList());
    return widgets;
  }

  Widget _singleItemDisplay(PickerItem item) {
    return Center(
      child: Text(item.toString()),
    );
  }
}
