import 'package:equatable/equatable.dart';
// import 'package:flutter_network/books/books.dart';
// import 'package:test/books/bloc/bloc.dart';
import '../bloc/bloc.dart';
// import 'package:test/books/books.dart';
import '../books.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

class BookLoad extends BookEvent {
  const BookLoad();

  @override
  List<Object> get props => [];
}

class BookCreate extends BookEvent {
  final Book book;

  const BookCreate(this.book);

  @override
  List<Object> get props => [book];

  @override
  String toString() => 'Book Created {book: $book}';
}

class BookUpdate extends BookEvent {
  final int id;
  final Book book;

  const BookUpdate(this.id,this.book);

  @override
  List<Object> get props => [id,book];

  @override
  String toString() => 'Book Updated {book: $book}';
}

class BookDelete extends BookEvent {
  final int id;
  // final Book book;

  const BookDelete(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Book Deleted {book id: $id}';
}