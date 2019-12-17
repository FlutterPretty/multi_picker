import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multi_picker/bean/picker_item.dart';

part 'country.g.dart';

@JsonSerializable()
class Country extends PickerItem {
  String name;

  Country(this.name) : super(name);

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
  @override
  String toString() {
    return name;
  }
}
