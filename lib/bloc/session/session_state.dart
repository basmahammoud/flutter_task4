import 'package:equatable/equatable.dart';

abstract class SessionState extends Equatable {
  final bool isAuthenticated;
  final String? username;

  const SessionState({required this.isAuthenticated, this.username});

  @override
  List<Object?> get props => [isAuthenticated, username];
}

class SessionInitial extends SessionState {
  const SessionInitial() : super(isAuthenticated: false);
}

class SessionAuthenticated extends SessionState {
  final DateTime loginTime;
 SessionAuthenticated({required this.loginTime, required super.isAuthenticated});
}

class SessionUnauthenticated extends SessionState {
  const SessionUnauthenticated() : super(isAuthenticated: false);
}