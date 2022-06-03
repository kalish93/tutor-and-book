import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test/books/repository/repository.dart';
import '../repository/book_repository.dart';

// import 'package:flutter_network/books/bloc/bloc.dart';
// import 'package:test/books/bloc/bloc.dart';
import '../bloc/bloc.dart';
import 'package:test/books/books.dart';

// import 'blocs.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookLoading()) {
    on<BookLoad>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await bookRepository.fetchAll();
        emit(BookOperationSuccess(books));
        print(books.isEmpty);
      } catch (error) {
        emit(BookOperationFailure(error));
      
      }
    });

    on<BookCreate>((event, emit) async {
      try {
        await bookRepository.create(event.book);
        final books = await bookRepository.fetchAll();
        emit(BookOperationSuccess(books));
      } catch (error) {
        emit(BookOperationFailure(error));
      }
    });

    on<BookUpdate>((event, emit) async {
      try {
        await bookRepository.update(event.id, event.book);
        final books = await bookRepository.fetchAll();
        emit(BookOperationSuccess(books));
      } catch (error) {
        emit(BookOperationFailure(error));
      }
    });

    on<BookDelete>((event, emit) async {
      try {
        await bookRepository.delete(event.id);
        final books = await bookRepository.fetchAll();
        emit(BookOperationSuccess(books));
      } catch (error) {
        emit(BookOperationFailure(error));
      }
    });
  }
}