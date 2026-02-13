import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class UsageEvent extends Equatable{
  const UsageEvent();
  @override
  List<Object?> get props => [];
}

class FetchUsageData extends UsageEvent {
  const FetchUsageData();
}