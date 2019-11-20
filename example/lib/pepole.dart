import 'package:multi_picker/bean/picker_item.dart';

class Pepole extends PickerItem {
  String name;

  Pepole(this.name) : super(name);

  @override
  String toString() {
    return name;
  }
}
