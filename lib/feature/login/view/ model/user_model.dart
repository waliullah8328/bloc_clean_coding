// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'token') @Default('') String token,
    @JsonKey(name: 'success') @Default('') String success,
    // ignore: duplicate_ignore
    // ignore: invalid_annotation_target
    @JsonKey(name: 'error') @Default('') String error,
  }) = _LoginModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
