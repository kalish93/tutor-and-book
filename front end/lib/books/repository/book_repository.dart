import 'package:meta/meta.dart';
// import 'package:test/books/data_provider/book_data.dart';
import '../data_provider/book_data.dart';
// import 'package:test/books/books.dart';
// import 'package:test/books/books.dart';
import '../books.dart';

// class BookRepository {
//   final BookDataProvider dataProvider;

//   BookRepository({required this.dataProvider})
//       : assert(dataProvider != null);

//   Future<Book> createBook(Book book) async {
//     return await dataProvider.createBook(book);
//   }

//   Future<List<Book>> getBooks() async {
//     return await dataProvider.getBooks();
//   }

//   Future<void> updateBook(Book book) async {
//     await dataProvider.updateBook(book);
//   }

//   Future<void> deleteBook(String id) async {
//     await dataProvider.deleteBook(id);
//   }
// }

class BookRepository {
  final BookDataProvider dataProvider;
  BookRepository(this.dataProvider);

  Future<Book> create(Book book) async {
    return dataProvider.create(book);
  }

  Future<Book> update(int id, Book book) async {
    return dataProvider.update(id, book);
  }

  Future<List<Book>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    dataProvider.delete(id);
  }
}