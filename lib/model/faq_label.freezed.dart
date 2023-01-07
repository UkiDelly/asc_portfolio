// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FAQLabel {
  String get label => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FAQLabelCopyWith<FAQLabel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQLabelCopyWith<$Res> {
  factory $FAQLabelCopyWith(FAQLabel value, $Res Function(FAQLabel) then) =
      _$FAQLabelCopyWithImpl<$Res, FAQLabel>;
  @useResult
  $Res call({String label, String path});
}

/// @nodoc
class _$FAQLabelCopyWithImpl<$Res, $Val extends FAQLabel>
    implements $FAQLabelCopyWith<$Res> {
  _$FAQLabelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQLabelCopyWith<$Res> implements $FAQLabelCopyWith<$Res> {
  factory _$$_FAQLabelCopyWith(
          _$_FAQLabel value, $Res Function(_$_FAQLabel) then) =
      __$$_FAQLabelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String path});
}

/// @nodoc
class __$$_FAQLabelCopyWithImpl<$Res>
    extends _$FAQLabelCopyWithImpl<$Res, _$_FAQLabel>
    implements _$$_FAQLabelCopyWith<$Res> {
  __$$_FAQLabelCopyWithImpl(
      _$_FAQLabel _value, $Res Function(_$_FAQLabel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? path = null,
  }) {
    return _then(_$_FAQLabel(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FAQLabel extends _FAQLabel {
  const _$_FAQLabel({required this.label, required this.path}) : super._();

  @override
  final String label;
  @override
  final String path;

  @override
  String toString() {
    return 'FAQLabel(label: $label, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQLabel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQLabelCopyWith<_$_FAQLabel> get copyWith =>
      __$$_FAQLabelCopyWithImpl<_$_FAQLabel>(this, _$identity);
}

abstract class _FAQLabel extends FAQLabel {
  const factory _FAQLabel(
      {required final String label, required final String path}) = _$_FAQLabel;
  const _FAQLabel._() : super._();

  @override
  String get label;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$_FAQLabelCopyWith<_$_FAQLabel> get copyWith =>
      throw _privateConstructorUsedError;
}
