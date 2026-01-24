// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reciter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReciterModel _$ReciterModelFromJson(Map<String, dynamic> json) {
  return _ReciterModel.fromJson(json);
}

/// @nodoc
mixin _$ReciterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get arName => throw _privateConstructorUsedError;
  String get reciterImage => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this ReciterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReciterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReciterModelCopyWith<ReciterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReciterModelCopyWith<$Res> {
  factory $ReciterModelCopyWith(
    ReciterModel value,
    $Res Function(ReciterModel) then,
  ) = _$ReciterModelCopyWithImpl<$Res, ReciterModel>;
  @useResult
  $Res call({
    int id,
    String name,
    String arName,
    String reciterImage,
    String? country,
  });
}

/// @nodoc
class _$ReciterModelCopyWithImpl<$Res, $Val extends ReciterModel>
    implements $ReciterModelCopyWith<$Res> {
  _$ReciterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReciterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? arName = null,
    Object? reciterImage = null,
    Object? country = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            arName: null == arName
                ? _value.arName
                : arName // ignore: cast_nullable_to_non_nullable
                      as String,
            reciterImage: null == reciterImage
                ? _value.reciterImage
                : reciterImage // ignore: cast_nullable_to_non_nullable
                      as String,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReciterModelImplCopyWith<$Res>
    implements $ReciterModelCopyWith<$Res> {
  factory _$$ReciterModelImplCopyWith(
    _$ReciterModelImpl value,
    $Res Function(_$ReciterModelImpl) then,
  ) = __$$ReciterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String arName,
    String reciterImage,
    String? country,
  });
}

/// @nodoc
class __$$ReciterModelImplCopyWithImpl<$Res>
    extends _$ReciterModelCopyWithImpl<$Res, _$ReciterModelImpl>
    implements _$$ReciterModelImplCopyWith<$Res> {
  __$$ReciterModelImplCopyWithImpl(
    _$ReciterModelImpl _value,
    $Res Function(_$ReciterModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReciterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? arName = null,
    Object? reciterImage = null,
    Object? country = freezed,
  }) {
    return _then(
      _$ReciterModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        arName: null == arName
            ? _value.arName
            : arName // ignore: cast_nullable_to_non_nullable
                  as String,
        reciterImage: null == reciterImage
            ? _value.reciterImage
            : reciterImage // ignore: cast_nullable_to_non_nullable
                  as String,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReciterModelImpl implements _ReciterModel {
  _$ReciterModelImpl({
    this.id = 0,
    this.name = '',
    this.arName = '',
    this.reciterImage = '',
    this.country = '',
  });

  factory _$ReciterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReciterModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String arName;
  @override
  @JsonKey()
  final String reciterImage;
  @override
  @JsonKey()
  final String? country;

  @override
  String toString() {
    return 'ReciterModel(id: $id, name: $name, arName: $arName, reciterImage: $reciterImage, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReciterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arName, arName) || other.arName == arName) &&
            (identical(other.reciterImage, reciterImage) ||
                other.reciterImage == reciterImage) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, arName, reciterImage, country);

  /// Create a copy of ReciterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReciterModelImplCopyWith<_$ReciterModelImpl> get copyWith =>
      __$$ReciterModelImplCopyWithImpl<_$ReciterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReciterModelImplToJson(this);
  }
}

abstract class _ReciterModel implements ReciterModel {
  factory _ReciterModel({
    final int id,
    final String name,
    final String arName,
    final String reciterImage,
    final String? country,
  }) = _$ReciterModelImpl;

  factory _ReciterModel.fromJson(Map<String, dynamic> json) =
      _$ReciterModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get arName;
  @override
  String get reciterImage;
  @override
  String? get country;

  /// Create a copy of ReciterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReciterModelImplCopyWith<_$ReciterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
