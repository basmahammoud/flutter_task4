import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/reset-app-data/reset_event.dart';
import 'package:flutter_task4/bloc/reset-app-data/reset_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetAppDataBloc extends Bloc<ResetAppDataEvent, ResetState> {
  ResetAppDataBloc() : super(ResetInitial()) {
    on<ResetRequested>((event, emit) async {
      print("EVENT RECEIVED");

      emit(ResetLoading());

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.clear();

        emit(const ResetSuccess());
      } catch (e) {
        print("ERROR: $e");

        emit(ResetInitial());
      }
    });
  }
}
