// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      token: json['token'] as String? ?? '',
      success: json['success'] as String? ?? '',
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'success': instance.success,
      'error': instance.error,
    };
