import 'package:equatable/equatable.dart';

abstract class SessionState extends Equatable {
  const SessionState();
  @override
  List<Object?> get props => [];
}

class SessionInitial extends SessionState {}

class SessionAuthenticated extends SessionState {
  final String username;
  final DateTime loginTime;
  const SessionAuthenticated({required this.username, required this.loginTime});
  @override
  List<Object?> get props => [username, loginTime];
}

class SessionUnauthenticated extends SessionState {}
