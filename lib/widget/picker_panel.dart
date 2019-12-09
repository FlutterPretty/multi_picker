import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_picker/bean/picker_item.dart';
import 'package:multi_picker/bean/picker_option.dart';
import 'package:multi_picker/bean/select_item.dart';
import 'package:multi_picker/widget/picker_list_widget.dart';
import 'package:multi_picker/widget/picker_action_bar.dart';

typedef List<Widget> CreateWidgetList();

class PickerPanel extends StatefulWidget {
  final List<PickerItem> data;
  final PickerOption option;
  final VoidCallback cancel;
  final ValueChanged<dynamic> confirm;
  final ValueChanged<SelectItem> selectCallback;

  PickerPanel(this.data,
      {Key key, this.option, this.cancel, this.confirm, this.selectCallback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PickerPanelState(data, option: option);
}

class PickerPanelState extends State<PickerPanel> {
  PickerOption option;
  List<PickerItem> data;
  List<PickerItem> data2;
  List<PickerItem> data3;

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

  PickerPanelState(this.data, {this.option});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (option == null) option = _getDefaultOption();
    multiNum = option.multiNum;
  }

  @override
  Widget build(BuildContext context) {
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
        widgets.add(_singleItemDisplay(i));
      } else if (i == 1) {
        data2 = data[selectIndex].childData;
        widgets.add(_singleItemDisplay(i));
      } else {
        data3 = data[selectIndex].childData[selectIndex2].childData;
        widgets.add(_singleItemDisplay(i));
      }
    }
    return widgets;
  }

  Widget _singleItemDisplay(int i) {
    return Expanded(
      flex: 1,
      child: PickerListWidget(
        key: _buildKey(i),
        scrollController: _buildScrollController(i),
        onSelectedItemChanged: (val) {
          if (this.widget.selectCallback != null)
            this.widget.selectCallback(SelectItem(i, val));
          switch (i) {
            case 0:
              setState(() {
                selectIndex = val;
                data2 = data[selectIndex].childData;
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
        createWidgetList: () {
          if (i == 0) {
            return data.map((v) {
              return Center(
                child: Text(v.toString()),
              );
            }).toList();
          } else if (i == 1) {
            return data2.map((v) {
              return Center(
                child: Text(v.toString()),
              );
            }).toList();
          } else {
            return data3.map((v) {
              return Center(
                child: Text(v.toString()),
              );
            }).toList();
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

  PickerOption _getDefaultOption() {
    PickerOption option = PickerOption();
    option.multiNum = 1;
    return option;
  }

  void notifyDataChanged() {
    setState(() {});
  }
}
