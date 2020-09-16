// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picker_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickerItem _$PickerItemFromJson(Map<String, dynamic> json) {
  return PickerItem(json['showTitle'] as String)
    ..childData = (json['childData'] as List)
        ?.map((e) =>
            e == null ? null : PickerItem.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PickerItemToJson(PickerItem instance) =>
    <String, dynamic>{
      'showTitle': instance.showTitle,
      'childData': instance.childData
    };
