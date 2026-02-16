import 'package:equatable/equatable.dart';

abstract class ResetState extends Equatable {
  const ResetState();

  @override
  List<Object?> get props => [];
}

class ResetInitial extends ResetState {
  const ResetInitial();
}

class ResetLoading extends ResetState {
  const ResetLoading();
}

class ResetSuccess extends ResetState {
  const ResetSuccess();
}