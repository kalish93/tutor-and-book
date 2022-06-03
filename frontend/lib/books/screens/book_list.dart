import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/books/constants/appbar.dart';
// import 'package:test/books/bloc/bloc.dart';
// import 'package:test/books/books.dart';
import '../books.dart';
import '../bloc/bloc.dart';
import '../bloc/books_bloc.dart';
import '../bloc/books_state.dart';
import '../constants/drawer.dart';
import 'book_add_update.dart';
import 'book_detail.dart';
import 'book_route.dart';

// import 'package:test/books/screens/book_add_update.dart';

// class BooksList extends StatelessWidget {
//   const BooksList({Key? key}) : super(key: key);
//   static const routeName = '/';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List of books'),
//       ),
//       body: BlocBuilder<BookBloc, BookState>(
//         builder: (_, state) {
//           if (state is BookOperationFailure) {
//             return Text('Could not do book operation');
//           }

//           if (state is BookLoadSuccess) {
//             final books = state.books;

//             return ListView.builder(
//               itemCount: books.length,
//               itemBuilder: (_, idx) => ListTile(
//                 title: Text('${books[idx].title}'),
//                 subtitle: Text('${books[idx].author}'),
//                 onTap: () => Navigator.of(context)
//                     .pushNamed(BookDetail.routeName, arguments: books[idx]),
//               ),
//             );
//           }

//           return CircularProgressIndicator();
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => Navigator.of(context).pushNamed(
//           AddUpdateBook.routeName,
//           arguments: BookArgument(edit: false),
//         ),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
class BooksList extends StatelessWidget {
  static const routeName = '/';

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
                onTap: () => Navigator.of(context).pushNamed(
                    BookDetail.routeName,
                    arguments: books.elementAt(idx)),
              ),
            );
          }

          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateBook.routeName,
          arguments: BookArgument(edit: false),
        ),
        label:Text("Share book"),

      ),
    );
  }
}