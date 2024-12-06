import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_onLoginChanged);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginChanged(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        loginStatus: LoginStatus.loading,
        message: "loading"),
    );
    Map data = {
      "email": state.email,
      "password": state.password
    };

    try {
      final response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: data);
           var result = jsonDecode(response.body);
      if(response.statusCode == 200){
        emit(state.copyWith(
            loginStatus: LoginStatus.success,
           // message: "Login Successful",
            message: "Login Successful",
        ),
        );

      }else{
        emit(state.copyWith(
            loginStatus: LoginStatus.error,
            message: result["error"]));

      }
    } catch (e) {
      emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: e.toString()));
    }
  }
}
