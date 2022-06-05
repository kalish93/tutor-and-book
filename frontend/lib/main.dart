import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/presentation/auth/Login.dart';
import '/presentation/book/book_list.dart';
import '/presentation/book/homePage.dart';
import '/presentation/tutor/tutors_list.dart';
import 'package:go_router/go_router.dart';

import 'application/auth/login/auth_bloc.dart';
import 'application/auth/login/auth_state.dart';
import 'application/book/books_bloc.dart';
import 'application/tutor/tutor_bloc.dart';
import 'infrastructure/auth/auth_repo.dart';
import 'infrastructure/book/book_data.dart';
import 'infrastructure/book/book_repository.dart';
import 'infrastructure/tutor/tutor_provider.dart';
import 'infrastructure/tutor/tutor_repository.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var access = prefs.getString('access');
  print(access);
  return runApp(Auth());
}

class Auth extends StatelessWidget {
   Auth({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/login',
    routes:[
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginUi(),

      ),
      GoRoute(path: '/home',
      name: 'home',
      builder: (context,state)=> homePage()
      ),
      GoRoute(path: '/books',
      name: '/books',
      builder: (context,state)=>BooksList()
    
    
      ),
      GoRoute(path: '/tutors',
      name: 'tutors',
      builder: (context,state)=>TutorList()
      )
      ]);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(repo: AuthRepository(), initialState: LoginInitState())),
        BlocProvider<BookBloc>(
            create: (context) => BookBloc( bookRepository: BookRepository(BookDataProvider()),)),
        BlocProvider<TutorBloc>(
          create: (context)=>TutorBloc(tutorRepository: TutorRepository(TutorDataProvider())),)
      ],
      child:  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Tutor + Book',
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      )
      ,
    );
  }
}
