class UserModel {
  String? userName;
  String? profile;
  String? uId;
  String? password;
  String? email;
  String? age;
  String? height;
  String? weight;
  String? bloodgrp;
  String? phone;
  List? followers;
  String? profilePic;
  String? profilePath;

  UserModel({
    this.userName,
    this.profile,
    this.uId,
    this.followers,
    this.password,
    this.email,
    this.age,
    this.height,
    this.weight,
    this.bloodgrp,
    this.phone,
    this.profilePic,
    this.profilePath,
  });

  factory UserModel.fromJson(json) {
    return UserModel(
      userName: json['userName'],
      profile: json['profile'],
      uId: json['uId'],
      email: json['email'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      bloodgrp: json['bloodgrp'],
      phone: json['phone'],
      followers: List<String>.from(json['followers'] ?? []),
      profilePic: json['profilePic'],
      profilePath: json['profilePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'profile': profile,
      'uId': uId,
      'email': email,
      'age':age,
      'height':height,
      'weight': weight,
      'bloodgrp': bloodgrp,
      'phone': phone,
      'profilePic': profilePic,
      'profilePath': profilePath,
      'followers': followers
    };
  }
}