import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'user_profile_entity.g.dart';

@JsonSerializable()
class UserProfileEntity extends Equatable {
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
  
  const UserProfileEntity({
    this.username = '',
    this.password = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
  });

  @override
  List<Object?> get props => [
        username,
        password,
        email,
        firstName,
        lastName,
      ];

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileEntityToJson(this);

}
