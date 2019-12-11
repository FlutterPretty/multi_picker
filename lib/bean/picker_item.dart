import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'picker_item.g.dart';

@JsonSerializable()
class PickerItem {
  String showTitle;
  List<PickerItem> childData = List();

  PickerItem(this.showTitle);

  factory PickerItem.fromJson(Map<String, dynamic> json) =>
      _$PickerItemFromJson(json);

  Map<String, dynamic> toJson() => _$PickerItemToJson(this);

  @override
  String toString() {
    return showTitle;
  }
}
