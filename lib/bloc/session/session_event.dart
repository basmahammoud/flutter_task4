import 'package:equatable/equatable.dart';

class SessionEvent extends Equatable {
  const SessionEvent();
  
  @override
  List<Object?> get props => [];
}

class SessionLogin extends SessionEvent {
  const SessionLogin();
}

class SessionLogout extends SessionEvent {
  const SessionLogout();
}

class SessionCheck extends SessionEvent {
  const SessionCheck();
}