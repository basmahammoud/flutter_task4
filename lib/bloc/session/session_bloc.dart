import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'session_event.dart';
import 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    // Login
    on<SessionLogin>((event, emit) async {
      emit(LoginLoading());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', event.username);
      await prefs.setString('loginTime', DateTime.now().toIso8601String());

      await Future.delayed(const Duration(seconds: 2));

      emit(
        SessionAuthenticated(
          loginTime: DateTime.now(),
          username: event.username,
        ),
      );
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

  print("SESSION CHECK CALLED");

  final prefs = await SharedPreferences.getInstance();

  print("ALL KEYS: ${prefs.getKeys()}");
  print("USERNAME: ${prefs.getString('username')}");
  print("IS LOGGED IN: ${prefs.getBool('isLoggedIn')}");

  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  if (isLoggedIn) {

    emit(
      SessionAuthenticated(
        loginTime: DateTime.parse(
          prefs.getString('loginTime') ??
          DateTime.now().toIso8601String(),
        ),
        username: prefs.getString('username') ?? '',
      ),
    );

  } else {

    emit(SessionUnauthenticated());

  }
});


    //reset session
    on<SessionReset>((event, emit) async {
      print("EVENT RECEIVED");

      // emit(ResetLoading());

      final prefs = await SharedPreferences.getInstance();

      await prefs.remove('isLoggedIn');

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();

        emit(SessionResetSuccess());
      } catch (e) {
        print("ERROR: $e");

        emit(SessionInitial());
      }
    });
  }
}
