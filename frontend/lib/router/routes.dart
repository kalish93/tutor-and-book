

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/Authentication/Ui/Login.dart';
import 'package:test/books/books.dart';
import 'package:test/books/screens/homePage.dart';
import '../books/screens/book_add_update.dart';
import '../books/screens/book_detail.dart';
import '../books/screens/book_list.dart';
import '../books/screens/homePage.dart';

// import 'Authentication/login/login.dart';

class MyRouter {

//final LoginState loginState;
MyRouter();//this.loginState);


  late final router = GoRouter(

  // refreshListenable: loginState,
  
  debugLogDiagnostics: true,
  
  urlPathStrategy: UrlPathStrategy.path,
  routes: [
    // TODO: Add Routes
    GoRoute(
      //name: rootRouteName,
      path: '/',
      redirect: (state) =>
      // TODO: Change to Home Route
     // state.namedLocation(loginRouteName),
    ),
    GoRoute(
      // name: loginRouteName,
      path: '/login',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const LoginUi(),
      ),
    ),
    GoRoute(
      name: createAccountRouteName,
      path: '/create-account',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child:  homePage(),
      ),
    ),
    GoRoute(
      path: '/book-list',
      name: BooksList.routeName,
      pageBuilder: (context,state) =>MaterialPage<void>(
        key: state.pageKey,
        child: BooksList())
      ),
      GoRoute(
        name: BookDetail.routeName,
        path: '/book-detail',
        pageBuilder: (context,state){
          final book = state.params['book'];
          return BookDetail(book: book),
        }
      ),
      GoRoute(
        path: '/book-add-update',
        name: AddUpdateBook.routeName,
        pageBuilder: (context,state)=>MaterialPage(
          key: state.pageKey,
          child: AddUpdateBook(),
        )
        )
  ],
  
);

  static get createAccountRouteName => null;

}