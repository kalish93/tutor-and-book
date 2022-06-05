import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/auth/user_model.dart';


abstract class Auth_Event extends Equatable {
  const Auth_Event();
  // @override
  // List<Object> get props => [];
  // @override
  // bool get stringify => true;
}

class StartEvent extends Auth_Event {
  const StartEvent();
  @override
  List<Object> get props => [];
}

//buttonpressed ev
class SignUpButtornPressed extends Auth_Event {
  // final String username;
  // final String first_name;
  // final String last_name;
  // final String email;
  // final String password;
  // SignUp(
  //     {required this.username,
  //     required this.last_name,
  //     required this.password,
  //     required this.email,
  //     required this.first_name});
  final User user;
  const SignUpButtornPressed(this.user);
  @override 
  List<Object> get props =>[user];
}
class RegisterSuccess extends Auth_Event {
  @override 
  List<Object> get props =>[];
 
}
