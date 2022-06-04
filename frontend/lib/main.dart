import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/books/bloc/bloc.dart';
import 'package:test/books/books.dart';

import 'Authentication/Ui/Login.dart';
import 'Authentication/Ui/get_contacts.dart';
import 'Authentication/Ui/post_contacts.dart';
import 'Authentication/bloc/auth_bloc.dart';
import 'Authentication/bloc/auth_state.dart';
import 'Authentication/repository/auth_repo.dart';

void main() => runApp(const Auth());

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(repo: AuthRepository(), initialState: LoginInitState())),
        BlocProvider<BookBloc>(
            create: (context) => BookBloc( bookRepository: BookRepository(BookDataProvider()),))


        //AuthBloc(AuthRepository())//LoginInitState(),AuthRepository()))
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginUi(),
          '/contact': (context) => const Contact(),
          '/books': (context)=> const BooksList(),
          '/addContact': (context) => const AddContact(),
        },
      )
      ,
    );
  }
}
