import 'package:equatable/equatable.dart';

class UsageState extends Equatable{
  const UsageState();

  @override
  List<Object?> get props => [];
}

class UsageInitial extends UsageState {
  const UsageInitial();
}

class UsageLoading extends UsageState {
  const UsageLoading();
}

class UsageSuccess extends UsageState {
  final String usageData;

  const UsageSuccess({required this.usageData});

  @override
  List<Object?> get props => [usageData];
}

class UsageFailure extends UsageState {
  final String errorMessage;

  const UsageFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}