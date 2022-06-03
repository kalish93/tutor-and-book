import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';


class AuthEvents extends Equatable{
  @override
  List<Object> get props => [];
    
}

class StartEvent extends AuthEvents{}
class LoginButtenPressed extends AuthEvents{
  final String ?email;
  final String ?password;
  LoginButtenPressed({this.email,this.password});

}
class LoginSuccess extends AuthEvents{
  
}