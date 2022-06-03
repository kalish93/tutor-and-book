import 'dart:convert';

import "package:http/http.dart" as http;

class AuthRepository {
  login(String ?username, String ?password)async{
  var res =await http.post(
    Uri.parse("http://127.0.0.1:8000/user/tokens/"),
      body: {
        "username": username,
        "password": password
      }
  );
  if(res.statusCode == 200) return res.body;
  return "user not found";
    }
}