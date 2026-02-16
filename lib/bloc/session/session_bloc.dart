import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'session_event.dart';
import 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    // Login
    on<SessionLogin>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', event.username);
      await prefs.setString('loginTime', DateTime.now().toIso8601String());

      emit(SessionAuthenticated(
        loginTime: DateTime.now(),
        username: event.username,
      ));
    });

    // Logout
    on<SessionLogout>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('isLoggedIn');
      await prefs.remove('username');
      await prefs.remove('loginTime');

      emit(SessionUnauthenticated());
    });

    // Check session (على Splash)
    on<SessionCheck>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      if (isLoggedIn) {
        emit(SessionAuthenticated(
          loginTime: DateTime.parse(prefs.getString('loginTime') ?? DateTime.now().toIso8601String()),
          username: prefs.getString('username') ?? '',
        ));
      } else {
        emit(SessionUnauthenticated());
      }
    });
  }
}
