// ignore_for_file: depend_on_referenced_packages

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:timesheet/domain/entities/login/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  @JsonKey(name: 'ResponseCode')
  final String? responseCode;
  @JsonKey(name: 'Description')
  final String? description;
  @JsonKey(name: 'Token')
  final String? token;

  const LoginModel({
    required this.responseCode,
    required this.description,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  LoginEntity toEntity() =>
      LoginEntity(token: token);

  @override
  List<Object?> get props =>
      [responseCode, description, token];
}
