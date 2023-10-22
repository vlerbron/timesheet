// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      responseCode: json['ResponseCode'] as String?,
      description: json['Description'] as String?,
      token: json['Token'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'ResponseCode': instance.responseCode,
      'Description': instance.description,
      'Token': instance.token,
    };
