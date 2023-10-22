import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:timesheet/domain/entities/login/user_profile_entity.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel extends Equatable {
  @JsonKey(name: 'ResponseCode')
  final String? responseCode;
  @JsonKey(name: 'Description')
  final String? description;
  @JsonKey(name: 'Username')
  final String username;
  @JsonKey(name: 'Password')
  final String password;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'FirstName')
  final String firstName;
  @JsonKey(name: 'LastName')
  final String lastName;

  const UserProfileModel({
    required this.responseCode,
    required this.description,
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  UserProfileEntity toEntity() => UserProfileEntity(
        username: username,
        password: password,
        email: email,
        firstName: firstName,
        lastName: lastName,
      );

  @override
  List<Object?> get props => [
        responseCode,
        description,
        username,
        password,
        email,
        firstName,
        lastName,
      ];
}
