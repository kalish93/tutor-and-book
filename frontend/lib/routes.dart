import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test/Authentication/Ui/Login.dart';
import 'package:test/books/screens/homePage.dart';

import 'Authentication/login/login.dart';

class MyRouter {

//final LoginState loginState;
MyRouter();//this.loginState);


  late final router = GoRouter(

  //refreshListenable: loginState,
  // 4
  debugLogDiagnostics: true,
  // 5
  urlPathStrategy: UrlPathStrategy.path,

  // 6
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
      //name: loginRouteName,
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
  ],
  // TODO: Add Error Handler
  // TODO Add Redirect
);

  static get createAccountRouteName => null;

}