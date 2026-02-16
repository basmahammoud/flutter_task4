import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String username;

  const LoginRequested({
    required this.username,
  });

  @override
  List<Object?> get props => [username];
}
