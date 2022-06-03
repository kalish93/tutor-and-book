
import 'package:equatable/equatable.dart';
// import 'package:flutter_network/books/books.dart';
// import 'package:test/books/bloc/bloc.dart';
// import 'package:test/books/books.dart';
import '../bloc/bloc.dart';
import '../books.dart';

class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookLoading extends BookState {}

class BookOperationSuccess extends BookState {
  final Iterable<Book> books;

  BookOperationSuccess([this.books = const []]);

  @override
  List<Object> get props => [books];
}

class BookOperationFailure extends BookState {
  final Object error;
  const BookOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}