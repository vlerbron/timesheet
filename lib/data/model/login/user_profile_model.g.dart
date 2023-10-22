// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      responseCode: json['ResponseCode'] as String?,
      description: json['Description'] as String?,
      username: json['Username'] as String,
      password: json['Password'] as String,
      email: json['Email'] as String,
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'ResponseCode': instance.responseCode,
      'Description': instance.description,
      'Username': instance.username,
      'Password': instance.password,
      'Email': instance.email,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
    };
