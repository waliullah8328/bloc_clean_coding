// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReciterModelImpl _$$ReciterModelImplFromJson(Map<String, dynamic> json) =>
    _$ReciterModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      arName: json['arName'] as String? ?? '',
      reciterImage: json['reciterImage'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$$ReciterModelImplToJson(_$ReciterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'arName': instance.arName,
      'reciterImage': instance.reciterImage,
      'country': instance.country,
    };
