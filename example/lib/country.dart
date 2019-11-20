import 'package:multi_picker/bean/picker_item.dart';

class Country extends PickerItem {
  String name;

  Country(this.name) : super(name);

  @override
  String toString() {
    return name;
  }
}
