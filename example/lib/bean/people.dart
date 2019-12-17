import 'package:multi_picker/bean/picker_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'people.g.dart';

@JsonSerializable()
class People extends PickerItem {
  String name;

  People(this.name) : super(name);

  factory People.fromJson(Map<String, dynamic> json) =>
      _$PeopleFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleToJson(this);
  @override
  String toString() {
    return name;
  }
}
