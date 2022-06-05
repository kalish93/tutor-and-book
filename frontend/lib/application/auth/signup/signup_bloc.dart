//import file now
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/src/repository_provider.dart';
import 'package:meta/meta.dart';
import 'package:test/application/auth/signup/signup_state.dart';
import '../../../application/auth/signup/signup_event.dart';
import '../../../infrastructure/auth/registration_repo.dart';

class AuthBloc extends Bloc<Auth_Event, AuthState> {
  final UserRepository registrationRepository;
  AuthBloc({required this.registrationRepository})
      : super(Idle()) {
    on<StartEvent>(((event, emit) {
      emit(Idle());
    }));
    on<SignUpButtornPressed>((event, emit) async {
      await registrationRepository.create(event.user);
      emit(CreateUserSuccced());
    });
  }
}
