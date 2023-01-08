// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FAQModel _$FAQModelFromJson(Map<String, dynamic> json) {
  return _FAQModel.fromJson(json);
}

/// @nodoc
mixin _$FAQModel {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQModelCopyWith<FAQModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQModelCopyWith<$Res> {
  factory $FAQModelCopyWith(FAQModel value, $Res Function(FAQModel) then) =
      _$FAQModelCopyWithImpl<$Res, FAQModel>;
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class _$FAQModelCopyWithImpl<$Res, $Val extends FAQModel>
    implements $FAQModelCopyWith<$Res> {
  _$FAQModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FAQModelCopyWith<$Res> implements $FAQModelCopyWith<$Res> {
  factory _$$_FAQModelCopyWith(
          _$_FAQModel value, $Res Function(_$_FAQModel) then) =
      __$$_FAQModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer});
}

/// @nodoc
class __$$_FAQModelCopyWithImpl<$Res>
    extends _$FAQModelCopyWithImpl<$Res, _$_FAQModel>
    implements _$$_FAQModelCopyWith<$Res> {
  __$$_FAQModelCopyWithImpl(
      _$_FAQModel _value, $Res Function(_$_FAQModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$_FAQModel(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FAQModel extends _FAQModel {
  const _$_FAQModel({required this.question, required this.answer}) : super._();

  factory _$_FAQModel.fromJson(Map<String, dynamic> json) =>
      _$$_FAQModelFromJson(json);

  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'FAQModel(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FAQModel &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FAQModelCopyWith<_$_FAQModel> get copyWith =>
      __$$_FAQModelCopyWithImpl<_$_FAQModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FAQModelToJson(
      this,
    );
  }
}

abstract class _FAQModel extends FAQModel {
  const factory _FAQModel(
      {required final String question,
      required final String answer}) = _$_FAQModel;
  const _FAQModel._() : super._();

  factory _FAQModel.fromJson(Map<String, dynamic> json) = _$_FAQModel.fromJson;

  @override
  String get question;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_FAQModelCopyWith<_$_FAQModel> get copyWith =>
      throw _privateConstructorUsedError;
}
