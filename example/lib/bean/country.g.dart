// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(json['name'] as String)
    ..showTitle = json['showTitle'] as String
    ..childData = (json['childData'] as List)
        ?.map((e) =>
            e == null ? null : PickerItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'showTitle': instance.showTitle,
      'childData': instance.childData,
      'name': instance.name
    };
