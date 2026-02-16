import 'package:equatable/equatable.dart';

class ResetAppDataEvent extends Equatable {
  const ResetAppDataEvent();
  
  @override
  List<Object?> get props => [];
}

class ResetRequested extends ResetAppDataEvent {
  const ResetRequested();
}

class ResetConfirmed extends ResetAppDataEvent {
  const ResetConfirmed();
}


