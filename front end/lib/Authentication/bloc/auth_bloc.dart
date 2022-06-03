

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'auth_event.dart';
import 'auth_event.dart';
import '../repository/auth_repo.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final AuthRepository repo;
  AuthState initialState;
  var pref ;//= SharedPreferences.getInstance();

  // AuthBloc(AuthState initialState, this.repo) : super(initialState);
  AuthBloc({required this.repo,required this.initialState}) : super(initialState){

  // @override
  // Stream<AuthState> mapEventToState(AuthEvents event) async* {
    // var pref = SharedPreferences.getInstance();
  //   if (event is StartEvent) {
  //     yield LoginInitState();
  //   } else if (event is LoginButtenPressed) {
  //     yield LoginLoadingState();
      // var data = await repo.login(event.email, event.password);
      // // if (data['type'] == 0) {
        // pref.setString("acsess", data['access']);
  //       // pref.setString("type", data['type']);
  //       yield UserLoginSuccessState();
  //     // } else if (data['type'] == 1) {
  //       // pref.setString('token', data['token']);
  //       // pref.setString('type', data['type']);
  //       // pref.setString('email', data['email']);
  //       // yield AdminLoginSuccessState();
  //     } else {
  //       yield LoginErrorState(message: 'authentication error');
  //     }

 on<StartEvent>((event,emit) async{
   pref =await SharedPreferences.getInstance();
    emit(LoginInitState());
  });
  on<LoginButtenPressed>((event, emit) async{
    emit(LoginLoadingState());
    var data = await repo.login(event.email, event.password);
      // if (data['type'] == 0) {
     //pref.setString("access", data['access']);
    //emit(UserLoginSuccessState());
    if (data=="user not found"){
      emit(LoginErrorState(message: "Login failed"));
    }
    else{
      emit(UserLoginSuccessState());
    }
  });
    }
  }
// }
