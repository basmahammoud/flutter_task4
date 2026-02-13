import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/login/login_event.dart';
import 'package:flutter_task4/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginInitial()) {

    on<LoginRequested>((event, emit) async {

      emit(LoginLoading());

      try {

        await Future.delayed(const Duration(seconds: 2));

        emit(const LoginSuccess());

      } catch (e) {

        emit(LoginFailure(errorMessage: e.toString()));

      }

    });

  }
}
