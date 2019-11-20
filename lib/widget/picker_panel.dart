import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_picker/bean/picker_item.dart';
import 'package:multi_picker/bean/picker_option.dart';
import 'package:multi_picker/bean/select_item.dart';
import 'package:multi_picker/widget/picker_list_widget.dart';
import 'package:multi_picker/widget/picker_action_bar.dart';

class PickerPanel extends StatefulWidget {
  final List<PickerItem> data;
  final PickerOption option;
  final VoidCallback cancel;
  final ValueChanged<dynamic> confirm;
  final ValueChanged<SelectItem> selectCallback;

  PickerPanel(this.data,
      {this.option, this.cancel, this.confirm, this.selectCallback});

  @override
  State<StatefulWidget> createState() => _PickerPanelState(
        data,
        option: option,
      );
}

class _PickerPanelState extends State<PickerPanel> {
  final PickerOption option;
  List<PickerItem> data;

  int selectIndex = 0;
  int selectIndex2 = 0;
  int selectIndex3 = 0;
  int multiNum = 1;

  FixedExtentScrollController scrollController1 =
      new FixedExtentScrollController();
  FixedExtentScrollController scrollController2 =
      new FixedExtentScrollController();
  FixedExtentScrollController scrollController3 =
      new FixedExtentScrollController();

  _PickerPanelState(this.data, {this.option}) {
    if (option != null) {
      multiNum = option.multiNum;
//      if (multiNum == 1) {
//        PickerItem item = PickerItem();
//        item.showTitle = "请选择";
//        data.insert(0, item);
//      } else if (multiNum == 2) {
//        PickerItem item = PickerItem();
//        item.showTitle = "请选择";
//        PickerItem item2 = PickerItem();
//        item2.showTitle = "请选择";
//        item.childData = [item2];
//        data.insert(0, item);
//      } else {
//        PickerItem item = PickerItem();
//        item.showTitle = "请选择";
//        PickerItem item2 = PickerItem();
//        item2.showTitle = "请选择";
//        PickerItem item3 = PickerItem();
//        item3.showTitle = "请选择";
//        item2.childData = [item3];
//        item.childData = [item2];
//        data.insert(0, item);
//      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.25),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white,
          height: 300,
          child: Column(
            children: <Widget>[
              PickerActionBar(
                cancel: () {
                  Navigator.pop(context);
                  if (this.widget.cancel != null) this.widget.cancel();
                },
                confirm: () {
                  Navigator.pop(context);
                  _returnData();
                },
              ),
              Expanded(
                flex: 1,
                child: _buildPickerContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _returnData() {
    if (this.widget.confirm != null) {
      switch (multiNum) {
        case 1:
          this.widget.confirm(data[selectIndex]);
          break;
        case 2:
          this.widget.confirm(data[selectIndex].childData[selectIndex2]);
          break;
        case 3:
          this.widget.confirm(data[selectIndex]
              .childData[selectIndex2]
              .childData[selectIndex3]);
          break;
        default:
          break;
      }
    }
  }

  Widget _buildPickerContent() {
    return Container(
      child: Row(
        children: _generateList(),
      ),
    );
  }

  List<Widget> _generateList() {
    List<Widget> widgets = List();
    for (int i = 0; i < multiNum; i++) {
      if (i == 0) {
        widgets.add(_singleItemDisplay(i, data));
      } else if (i == 1) {
        widgets.add(_singleItemDisplay(i, data[selectIndex].childData));
      } else {
        widgets.add(_singleItemDisplay(
            i, data[selectIndex].childData[selectIndex2].childData));
      }
    }
    return widgets;
  }

  Widget _singleItemDisplay(int i, List<PickerItem> dataList) {
    return Expanded(
      flex: 1,
      child: PickerListWidget(
        key: _buildKey(i),
        data: dataList,
        scrollController: _buildScrollController(i),
        onSelectedItemChanged: (val) {
          if (this.widget.selectCallback != null)
            this.widget.selectCallback(SelectItem(i, val - 1));
          switch (i) {
            case 0:
              setState(() {
                selectIndex = val;
              });
              scrollController2.jumpToItem(0);
              break;
            case 1:
              setState(() {
                selectIndex2 = val;
              });
              scrollController3.jumpToItem(0);
              break;
            default:
              setState(() {
                selectIndex3 = val;
              });
              break;
          }
        },
      ),
    );
  }

  Key _buildKey(int index) {
    if (index == 0) {
      return Key("layer1");
    } else if (index == 1) {
      return Key("layer2");
    } else {
      return Key("layer3");
    }
  }

  FixedExtentScrollController _buildScrollController(int index) {
    if (index == 0) {
      return scrollController1;
    } else if (index == 1) {
      return scrollController2;
    } else {
      return scrollController3;
    }
  }
}
