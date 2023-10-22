// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileEntity _$UserProfileEntityFromJson(Map<String, dynamic> json) =>
    UserProfileEntity(
      username: json['Username'] as String? ?? '',
      password: json['Password'] as String? ?? '',
      email: json['Email'] as String? ?? '',
      firstName: json['FirstName'] as String? ?? '',
      lastName: json['LastName'] as String? ?? '',
    );

Map<String, dynamic> _$UserProfileEntityToJson(UserProfileEntity instance) =>
    <String, dynamic>{
      'Username': instance.username,
      'Password': instance.password,
      'Email': instance.email,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
    };
