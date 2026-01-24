
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reciter.freezed.dart';
part 'reciter.g.dart';

@freezed
class ReciterModel with _$ReciterModel{

  factory ReciterModel({
    @Default(0)  int id,
    @Default('') String name,
    @Default('') String arName,
    @Default('') String reciterImage,
    @Default('') String? country,


  })= _ReciterModel;

  factory ReciterModel.fromJson(Map<String,dynamic> json)=> _$ReciterModelFromJson(json);

}