import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task4/bloc/usage/usage_event.dart';
import 'package:flutter_task4/bloc/usage/usage_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsageBloc extends Bloc<UsageEvent, UsageState> {
  static const _homeVisitsKey = "home_visits";

  UsageBloc() : super(UsageInitial()) {
    on<FetchUsageData>((event, emit) async {
      emit(UsageLoading());

      try {
        final prefs = await SharedPreferences.getInstance();
        // قراءة العداد الحالي
        int currentVisits = prefs.getInt(_homeVisitsKey) ?? 0;
        // زيادة العداد
        currentVisits++;
        // حفظ العدد الجديد 
        await prefs.setInt(_homeVisitsKey, currentVisits);

        emit(UsageSuccess(usageData: currentVisits.toString()));
      } catch (e) {
        emit(UsageFailure(errorMessage: e.toString()));
      }
    });
  }
}
