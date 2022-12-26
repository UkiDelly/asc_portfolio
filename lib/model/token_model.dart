
import 'package:asc_portfolio/constant/enum/user/user_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const TokenModel._();

  factory TokenModel({
    required RoleType roleType,
    required String accessToken,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}

