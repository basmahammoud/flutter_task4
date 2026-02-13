import 'package:equatable/equatable.dart';

class UserNameState extends Equatable {
  final String name;

  UserNameState({required this.name});

  @override
  List<Object?> get props => [name];
}

class UserNameInitial extends UserNameState {
  UserNameInitial() : super(name: '');
}

class UserNameUpdated extends UserNameState {
  UserNameUpdated({required String name}) : super(name: name);
}
