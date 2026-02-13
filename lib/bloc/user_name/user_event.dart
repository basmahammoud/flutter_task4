import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserName extends UserEvent {
  final String name;

  const FetchUserName({required this.name});

  @override
  List<Object?> get props => [name];
}
