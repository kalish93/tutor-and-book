import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/books/bloc/bloc.dart';
import 'package:test/books/books.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/books/screens/homePage.dart';
import 'package:test/tutor/index.dart';
import 'Authentication/Ui/Login.dart';
import 'Authentication/Ui/get_contacts.dart';
import 'Authentication/Ui/post_contacts.dart';
import 'Authentication/bloc/auth_bloc.dart';
import 'Authentication/bloc/auth_state.dart';
import 'Authentication/repository/auth_repo.dart';
import 'package:go_router/go_router.dart';

// void main() => runApp(const Auth());

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

        // routes: [
        //   GoRoute(
        //     path:':id',
        //     name: "post-detail",
        //     builder: (context, state){
        //       final pid = int.parse(state.params['id']!);
        //       return PostDetail(id: pid);},
        //       routes: [
        //       GoRoute(
        //         path:'donate/:post',
        //         name: 'donate',
        //         builder: (context, state) {
        //           final pid = (int.parse(state.params['id']!));
        //           final post = state.params['post']!;
        //           return Donation_screen(pid: pid, post: post);
        //         },
        //         // routes:[
        //         //   GoRoute(path: 'thanks',
        //         //   name:'thankYou',
        //         //   builder: (context, state) => Thankyou_Screen())
        //         // ]
        //          )
        //          ]
        //          ),
        // ]
        // ]
        // ),

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


        //AuthBloc(AuthRepository())//LoginInitState(),AuthRepository()))
      ],
      // child: MaterialApp(
      //   initialRoute: '/',
      //   routes: {
      //     '/': (context) => const LoginUi(),
      //     '/contact': (context) => const Contact(),
      //     '/books': (context)=> const BooksList(),
      //     '/addContact': (context) => const AddContact(),
      //   },
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
