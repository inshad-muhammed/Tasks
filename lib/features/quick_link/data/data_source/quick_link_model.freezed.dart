// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quick_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuickLinkModel _$QuickLinkModelFromJson(Map<String, dynamic> json) {
  return _QuickLinkModel.fromJson(json);
}

/// @nodoc
mixin _$QuickLinkModel {
  String get label => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  /// Serializes this QuickLinkModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuickLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuickLinkModelCopyWith<QuickLinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickLinkModelCopyWith<$Res> {
  factory $QuickLinkModelCopyWith(
    QuickLinkModel value,
    $Res Function(QuickLinkModel) then,
  ) = _$QuickLinkModelCopyWithImpl<$Res, QuickLinkModel>;
  @useResult
  $Res call({String label, String imagePath});
}

/// @nodoc
class _$QuickLinkModelCopyWithImpl<$Res, $Val extends QuickLinkModel>
    implements $QuickLinkModelCopyWith<$Res> {
  _$QuickLinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuickLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? imagePath = null}) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            imagePath: null == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuickLinkModelImplCopyWith<$Res>
    implements $QuickLinkModelCopyWith<$Res> {
  factory _$$QuickLinkModelImplCopyWith(
    _$QuickLinkModelImpl value,
    $Res Function(_$QuickLinkModelImpl) then,
  ) = __$$QuickLinkModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String imagePath});
}

/// @nodoc
class __$$QuickLinkModelImplCopyWithImpl<$Res>
    extends _$QuickLinkModelCopyWithImpl<$Res, _$QuickLinkModelImpl>
    implements _$$QuickLinkModelImplCopyWith<$Res> {
  __$$QuickLinkModelImplCopyWithImpl(
    _$QuickLinkModelImpl _value,
    $Res Function(_$QuickLinkModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuickLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? imagePath = null}) {
    return _then(
      _$QuickLinkModelImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        imagePath: null == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuickLinkModelImpl implements _QuickLinkModel {
  const _$QuickLinkModelImpl({required this.label, required this.imagePath});

  factory _$QuickLinkModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuickLinkModelImplFromJson(json);

  @override
  final String label;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'QuickLinkModel(label: $label, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuickLinkModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, imagePath);

  /// Create a copy of QuickLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuickLinkModelImplCopyWith<_$QuickLinkModelImpl> get copyWith =>
      __$$QuickLinkModelImplCopyWithImpl<_$QuickLinkModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuickLinkModelImplToJson(this);
  }
}

abstract class _QuickLinkModel implements QuickLinkModel {
  const factory _QuickLinkModel({
    required final String label,
    required final String imagePath,
  }) = _$QuickLinkModelImpl;

  factory _QuickLinkModel.fromJson(Map<String, dynamic> json) =
      _$QuickLinkModelImpl.fromJson;

  @override
  String get label;
  @override
  String get imagePath;

  /// Create a copy of QuickLinkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuickLinkModelImplCopyWith<_$QuickLinkModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
