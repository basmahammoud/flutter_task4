import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDarkMode: false)) {

    on<ToggleTheme>((event, emit) {
      emit(state.copyWith(
        isDarkMode: !state.isDarkMode,
      ));
    });

    on<ResetTheme>((event, emit) {
      emit(const ThemeState(isDarkMode: false));
    });

  }
}
