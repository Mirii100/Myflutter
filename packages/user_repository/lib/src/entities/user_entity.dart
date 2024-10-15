import 'package:flutter/material.dart';
class MyUserEntity {
  final String name;
  final String userId;
  final String email;
  final String password;
  bool hasActiveCart;

  MyUserEntity({required this.name,
    required this.userId,
    required this.password,
    required this.email,
  required this.hasActiveCart});

  Map<String, dynamic> toMap() {
    return {
      'uid': name,
      'email': email,
      'passord':password,

    };


  }
  Map<String, Object> toDocument() {
    return {
      'name': name,
      'email': email,
      'passord':password,
      'hasActivecart':hasActiveCart,


    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc ){
    return MyUserEntity(name: doc['name'],
        userId: doc['userId'],
        password: doc['password'],
        email: doc['email'],
        hasActiveCart: doc['hasActiveCart']
    );
  }

}
