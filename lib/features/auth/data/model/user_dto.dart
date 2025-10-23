import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/domain/model/user_model.dart';
part 'user_dto.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "username")
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  @JsonKey(name: "_id")
  String? id;
  String? createdAt;

  User({
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserModel userModel() {
    return UserModel(
      createAt: createdAt,
      email: email,
      firstName: firstName,
      id: id,
      isVerified: isVerified,
      lastName: lastName,
      phone: phone,
      role: role,
      userName: userName,
    );
  }
}
