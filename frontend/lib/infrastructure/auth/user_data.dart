import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/auth/user_model.dart';

class UserDataProvider {
  static const String _postUrl = "http://127.0.0.1:8000/user/users/";

  Future<User> create(User user) async {
    final http.Response response = await http.post(Uri.parse(_postUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": user.username,
          "email": user.email,
          "first_name": user.first_name,
          "last_name": user.last_name,
          "password": user.password,
        }));

    if (response.statusCode == 201) {
      print("successfully created a user");

      return User.fromJson(jsonDecode(response.body));
    }
    {
      print("Failed to create user");
      throw Exception("Failed to create user");
    }
  }
}
