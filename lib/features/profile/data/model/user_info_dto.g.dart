// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) => UserInfoDto(
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserInfoDtoToJson(UserInfoDto instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  createdAt: json['createdAt'] as String?,
  email: json['email'] as String?,
  firstName: json['firstName'] as String?,
  id: json['_id'] as String?,
  isVerified: json['isVerified'] as bool?,
  lastName: json['lastName'] as String?,
  phoneNumber: json['phone'] as String?,
  role: json['role'] as String?,
  userName: json['username'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  '_id': instance.id,
  'username': instance.userName,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phoneNumber,
  'role': instance.role,
  'isVerified': instance.isVerified,
  'createdAt': instance.createdAt,
};
