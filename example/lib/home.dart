import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_picker/widget/picker_panel.dart';
import 'package:multi_picker/bean/picker_option.dart';
import 'package:multi_picker_example/country.dart';
import 'package:multi_picker_example/pepole.dart';
import 'package:multi_picker/bean/picker_item.dart';
import 'package:multi_picker/bean/select_item.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PickerItem> data = List();

  @override
  void initState() {
    super.initState();
    List<PickerItem> childData = List();
    childData.add(Pepole("张三"));
    childData.add(Pepole("李四"));
    childData.add(Pepole("王五"));
    childData.add(Pepole("赵六"));

    Country cn = Country("中国");
    cn.childData = childData;
    data.add(cn);
    Country am = Country("美国");

    data.add(am);
    data.add(Country("英国"));
    data.add(Country("德国"));
    data.add(Country("法国"));
    data.add(Country("日本"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              opaque: false,
              pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) =>
                  FadeTransition(
                      //使用渐隐渐入过渡,
                      opacity: animation,
                      child: PickerPanel(
                        data,
                        option: PickerOption(multiNum: 2),
                        selectCallback: (val) {
                          SelectItem item = val;
                          if (item.layer == 0) {
                            if (item.index == 1) {
                              setState(() {
                                List<PickerItem> childData = List();
                                childData.add(Pepole("陈七"));
                                childData.add(Pepole("刘八"));
                                childData.add(Pepole("朱九"));
                                childData.add(Pepole("韩十"));
                                data[1].childData = childData;
                              });
                            } else if (item.index == 2) {
                              setState(() {
                                List<PickerItem> childData = List();
                                childData.add(Pepole("Tom"));
                                childData.add(Pepole("Jerry"));
                                childData.add(Pepole("Green"));
                                childData.add(Pepole("White"));
                                childData.add(Pepole("Red"));
                                childData.add(Pepole("Yellow"));
                                data[item.index].childData = childData;
                              });
                            }
                          }
                        },
//                        cancel: () {},
//                        confirm: (val) {
//                          print(val);
//                        },
                      ))));
        },
        child: Center(
          child: Text('Running on:\n'),
        ),
      ),
    );
  }
}
