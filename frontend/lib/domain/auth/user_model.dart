import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User {
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String password;

  User(
      {required this.password,
      required this.username,
      required this.first_name,
      required this.last_name,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      password: json['password'],
    );
  }

}