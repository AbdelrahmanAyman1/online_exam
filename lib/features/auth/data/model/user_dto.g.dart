// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  userName: json['username'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
  isVerified: json['isVerified'] as bool?,
  id: json['_id'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'username': instance.userName,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'role': instance.role,
  'isVerified': instance.isVerified,
  '_id': instance.id,
  'createdAt': instance.createdAt,
};
