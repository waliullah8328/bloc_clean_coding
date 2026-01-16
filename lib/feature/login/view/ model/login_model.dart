// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    @JsonKey(name: 'token') @Default('') String token,
    // ignore: duplicate_ignore
    // ignore: invalid_annotation_target
    @JsonKey(name: 'error') @Default('') String error,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
