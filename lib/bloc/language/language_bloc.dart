import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/language/language_event.dart';
import 'package:flutter_task4/bloc/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageChangedEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(currentLanguage: 'en')) {

    on<ChangeLanguage>((event, emit) {
      emit(state.copyWith(currentLanguage: event.languageCode));
    });

    // on<ResetLanguage>((event, emit) {
    //   emit(const LanguageState(currentLanguage: 'en'));
    // });

  }
}