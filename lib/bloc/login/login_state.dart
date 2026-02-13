import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

// الحالة الابتدائية
class LoginInitial extends LoginState {
  const LoginInitial();
}

// أثناء تسجيل الدخول
class LoginLoading extends LoginState {
  const LoginLoading();
}

// نجاح تسجيل الدخول
class LoginSuccess extends LoginState {
    final String username; 
  const LoginSuccess({required this.username});
}

// فشل تسجيل الدخول
class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
