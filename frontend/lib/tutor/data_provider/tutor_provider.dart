import 'dart:convert';
import 'package:meta/meta.dart';
import '../models/tutor.dart';
import 'package:http/http.dart' as http;

class TutorDataProvider{
  static const String _baseUrl = "http://127.0.0.1:8000/user/tutor";
  Future<List<Tutor>> fetchAll() async{
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200){
      print('yes');
      final tutors = jsonDecode(response.body) as List;
      return tutors.map((c)=>Tutor.fromJson(c)).toList();
      } else {
      throw Exception("Could not fetch list of tutors");
    }
    }
  } 

