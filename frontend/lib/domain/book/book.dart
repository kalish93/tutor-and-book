
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


class Book{

  final int? id;
  final String title;
  final String author;
  final String ?description;
  // final int total_pages;
  final int total_pages;
  // final int edition;
  Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.description,
      // required this.total_pages,
      required this.total_pages,
      // required this.edition,
      
      });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      total_pages: json['total_pages'],
      // total_pages: json['to'],
      // edition: json['edition'],

    );
  }
}

