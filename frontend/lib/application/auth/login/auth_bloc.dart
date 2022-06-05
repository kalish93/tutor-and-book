

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'auth_event.dart';
import 'auth_event.dart';
import '../../../infrastructure/auth/auth_repo.dart';


import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final AuthRepository repo;
  AuthState initialState;
  var pref ;
  AuthBloc({required this.repo,required this.initialState}) : super(initialState){
 on<StartEvent>((event,emit) async{
    emit(LoginInitState());
  });
  on<LoginButtenPressed>((event, emit) async{
    emit(LoginLoadingState());
    var data = await repo.login(event.email, event.password);
    if (data=="user not found"){
      emit(LoginErrorState(message: "Login failed"));
    }
    else{
      emit(UserLoginSuccessState());
    }
  });
    }
  }

