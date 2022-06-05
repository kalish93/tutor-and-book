import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/book/books_bloc.dart';
import '../../application/book/books_state.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import 'package:go_router/go_router.dart';

class BooksList extends StatelessWidget {

  const BooksList({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {

    return Scaffold(



      appBar:myAppBar("Books list"),
      drawer: myDrawer(),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (_, state) {
          if (state is BookOperationFailure) {
            return const Text('Could not do book operation');
          }

          if (state is BookOperationSuccess) {
            final books = state.books;

            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text(books.elementAt(idx).title),
                subtitle: Text(books.elementAt(idx).author),
              ),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
      
      );
  }
}