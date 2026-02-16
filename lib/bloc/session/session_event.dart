import 'package:equatable/equatable.dart';

class SessionEvent extends Equatable {
  const SessionEvent();
  
  @override
  List<Object?> get props => [];
}

class SessionLogin extends SessionEvent {
  final String username;

  const SessionLogin(this.username);

  @override
  List<Object?> get props => [username];
}


class SessionLogout extends SessionEvent {
  const SessionLogout();
}

class SessionCheck extends SessionEvent {
  const SessionCheck();
}