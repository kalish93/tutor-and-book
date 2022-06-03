import 'package:flutter/material.dart';
import 'package:test/Authentication/Ui/Login.dart';
// import 'package:test/books/books.dart';

import '../books.dart';
// import 'package:test/books/screens/book_add_update.dart';

class BookAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => LoginUi());
    }

    if (settings.name == AddUpdateBook.routeName) {
      BookArgument args = settings.arguments as BookArgument;
      return MaterialPageRoute(
          builder: (context) => AddUpdateBook(
                args: args,
              ));
    }

    if (settings.name == BookDetail.routeName) {
      Book book = settings.arguments as Book;
      return MaterialPageRoute(
          builder: (context) => BookDetail(
                book: book,
              ));
    }

    return MaterialPageRoute(builder: (context) =>LoginUi());
  }
}

class BookArgument {
  final Book? book;
  final bool edit;
  BookArgument({this.book,required this.edit});
}