import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_network/books/books.dart';
// import 'package:test/books/books.dart';
import '../books.dart';
// import 'package:test/books/screens/book_add_update.dart';
import '../screens/book_add_update.dart';
import 'book_list.dart';
import 'book_route.dart';
import '../models/book.dart';
import '../bloc/books_bloc.dart';
import '../bloc/books_event.dart';

// class BookDetail extends StatelessWidget {
//   static const routeName = 'courseDetail';
//   final Book book;

//   BookDetail({required this.book});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${this.book.title}'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () => Navigator.of(context).pushNamed(
//               AddUpdateBook.routeName,
//               arguments: BookArgument(book: this.book, edit: true),
//             ),
//           ),
//           SizedBox(
//             width: 32,
//           ),
//           IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () {
//                 context.read<BookBloc>().add(BookDelete(this.book));
//                 Navigator.of(context).pushNamedAndRemoveUntil(
//                     BooksList.routeName, (route) => false);
//               }),
//         ],
//       ),
//       body: Card(
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('Title: ${this.book.title}'),
//               subtitle: Text('author: ${this.book.author}'),
//             ),
//             Text(
//               'Details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(this.book.description),
//           ],
//         ),
//       ),
//     );
//   }
// }
class BookDetail extends StatelessWidget {
  static const routeName = 'bookDetail';
  final Book book;

  const BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateBook.routeName,
              arguments: BookArgument(book: book, edit: true),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<BookBloc>(context)
                    .add(BookDelete(book.id ?? 0));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    BooksList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${book.title}'),
              subtitle: Text('author: ${book.author}'),
            ),
            const Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(book.description ?? ""),
          ],
        ),
      ),
    );
  }
}