import 'package:meta/meta.dart';
import '../../domain/book/book.dart';
import '../../infrastructure/book/book_data.dart';


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