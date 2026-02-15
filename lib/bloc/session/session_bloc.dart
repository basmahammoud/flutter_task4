import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/session/session_event.dart';
import 'package:flutter_task4/bloc/session/session_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    //login
    on<SessionLogin>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true);
      await prefs.setString('loginTime', DateTime.now().toIso8601String());
      emit(
        SessionAuthenticated(loginTime: DateTime.now(), isAuthenticated: true),
      );
    });

    //logout
    on<SessionLogout>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.remove('loginTime');
      emit(const SessionUnauthenticated());
    });
     //check session
    on<SessionCheck>((event, emit) async{
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (isLoggedIn) {
        final loginTimeStr = prefs.getString('loginTime');
        final loginTime = loginTimeStr != null ? DateTime.parse(loginTimeStr) : DateTime.now();
        emit(SessionAuthenticated(loginTime: loginTime, isAuthenticated: true));
      } else {
      emit(const SessionUnauthenticated());
      }
    });
  }
}
