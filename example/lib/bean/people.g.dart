// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) {
  return People(json['name'] as String)
    ..showTitle = json['showTitle'] as String
    ..childData = (json['childData'] as List)
        ?.map((e) =>
            e == null ? null : PickerItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'showTitle': instance.showTitle,
      'childData': instance.childData,
      'name': instance.name
    };
