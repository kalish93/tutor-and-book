import 'dart:convert';

import 'package:meta/meta.dart';
// import 'package:test/books/models/book.dart';
import '../models/book.dart';
import 'package:http/http.dart' as http;

// class BookDataProvider {
//   final _baseUrl = 'http://127.0.0.1:8000/api';
//   final http.Client httpClient;

//   BookDataProvider({required this.httpClient}) : assert(httpClient != null);

//   Future<Book> createBook(Book book) async {
//     final response = await httpClient.post(
//       Uri.http('127.0.0.1:8000', '/books'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'title': book.title,
//         'author': book.author,
//         'description': book.description,
//         // 'pages': book.total_pages,
//         'publication_year':book.publication_year,
//         // 'edition':book.edition,
        
//       }),
//     );

//     if (response.statusCode == 200) {
//       return Book.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to create book.');
//     }
//   }

//   Future<List<Book>> getBooks() async {
//     final response = await httpClient.get('$_baseUrl/books' as Uri);

//     if (response.statusCode == 200) {
//       final books = jsonDecode(response.body) as List;
//       return books.map((book) => Book.fromJson(book)).toList();
//     } else {
//       throw Exception('Failed to load books');
//     }
//   }

//   Future<void> deleteBook(String id) async {
//     final http.Response response = await httpClient.delete(
//       '$_baseUrl/books/$id' as Uri,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );

//     if (response.statusCode != 204) {
//       throw Exception('Failed to delete book.');
//     }
//   }

//   Future<void> updateBook(Book book) async {
//     final http.Response response = await httpClient.put(
//       '$_baseUrl/books/${book.id}' as Uri,
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, dynamic>{
//         'title': book.title,
//         'author': book.author,
//         'description': book.description,
//         // 'pages': book.total_pages,
//         'publication_year':book.publication_year,
//         // 'edition':book.edition,
//       }),
//     );

//     if (response.statusCode != 204) {
//       throw Exception('Failed to update book.');
//     }
//   }
// }
class BookDataProvider {
  static const String _baseUrl = "http://127.0.0.1:8000/api/books/";

  Future<Book> create(Book book) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "author": book.author,
          "title": book.title,
          "total_pages": book.total_pages,
          "description": book.description,
        }));

    if (response.statusCode == 201) {
      return Book.fromJson(jsonDecode(response.body));
    
    }
    {
      throw Exception("Failed to create book");
    }
  }
  
  // Future<Book> fetchByCode(String title) async {
  //   final response = await http.get(Uri.parse("$_baseUrl/$title"));

  //   if (response.statusCode == 200) {
  //     return Book.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Fetching Book by title failed");
  //   }
  // }

  Future<List<Book>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final  books= jsonDecode(response.body) as List;
      return books.map((c) =>Book.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch books");
    }
  }

  Future<Book> update(int id, Book book) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id":id,
          "author": book.author,
          "title": book.title,
          "totoal_pages": book.total_pages,
          "description": book.description
        }));

    if (response.statusCode == 200) {
      return Book.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the book");
    }
  }

  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the book");
    }
  }
}