import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/user_name/user_event.dart';
import 'package:flutter_task4/bloc/user_name/user_state.dart';

class UserNameBloc extends Bloc<UserEvent, UserNameState> {
  UserNameBloc() : super(UserNameInitial()) {
    on<FetchUserName>((event, emit) {
      
      emit(UserNameUpdated(name: event.name));
    });
  }
}