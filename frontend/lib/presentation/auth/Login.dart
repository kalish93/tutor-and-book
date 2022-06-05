import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/auth/login/auth_bloc.dart';
import '../../application/auth/login/auth_event.dart';
import '../../application/auth/login/auth_state.dart';
import 'package:go_router/go_router.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  TextEditingController usernames = TextEditingController();
  TextEditingController password = TextEditingController();

  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = const Center(
      child: Icon(
        Icons.supervised_user_circle,
        size: 150,
        color: Colors.black12,
      ),
    );

    final msg = BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginErrorState) {
        return Text(state.message);
      } else if (state is LoginLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });
    final username = TextField(
      controller: usernames,
      keyboardType: TextInputType.name,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          filled: true,
          fillColor: const Color(0x0fffffdd),
          hintStyle: const TextStyle(
            color: Color(0x0ff66666),
          ),
          hintText: 'Username',
          // contentPadding: const EdgeInsets.fromLTRB(200.0, 10.0, 195.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )),
    );

    final pass = TextField(
      controller: password,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        filled: true,
        fillColor: const Color(0xfff2f3f5),
        hintStyle: const TextStyle(
          color: Color(0xff66666),
        ),
        hintText: 'password',
        // contentPadding: const EdgeInsets.fromLTRB(200, 10, 195, 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );

    final loginButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          // ignore: todo
          //TODO : login here...

          authBloc.add(
            LoginButtenPressed(email: usernames.text, password: password.text));
        },
        child: const Text(
          'Log In',
          style: TextStyle(color: Color.fromARGB(255, 235, 5, 36)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            // Navigator.push(context,MaterialPageRoute(builder: (context)=>homePage()));
          // }else if(state is AdminLoginSuccessState){
          //    Navigator.pushNamed(context ,'/addContacts');
          context.go('/home');
          }
        },
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              const SizedBox(height: 20.0),
              msg,
              const SizedBox(height: 48.0),
              username,
              const SizedBox(height: 20.0),
              pass,
              const SizedBox(height: 24.0, width: 10,),
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
