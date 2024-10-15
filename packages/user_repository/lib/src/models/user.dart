import 'package:flutter/material.dart';

import '../entities/entities.dart';


class MyUser {
  final String name;
  final String userId;
  final String email;
  final String password;
//bool hasActiveCart;

  MyUser({required this.name,
    required this.userId,
    required this.password,
    required this.email, required String uid});

  Map<String, dynamic> toMap() {
    return {
      'uid': name,
      'email': email,
      'passord':password,

    };
  }

  static final empty=MyUser(
      name: '',
      userId: '',
      password: '',
      email: 'email', uid: ''
  );
  MyUserEntity toEntity(){
    return MyUserEntity(
      name: name,
      userId: userId,
      password: password,
      email: email, hasActiveCart: false,

    );
  }
  static MyUser fromEntity(MyUserEntity entity){
    return MyUser(name: entity.name,
        userId: entity.userId,
        password: entity.password,
        email:entity.email, uid: ''
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'my user $userId,$email,$name,$password';
  }
// You can add more fields and methods as needed.
}