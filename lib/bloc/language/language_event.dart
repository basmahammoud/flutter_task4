import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LanguageChangedEvent extends Equatable{
  const LanguageChangedEvent();

  @override
  List<Object?> get props => [];
}

class ChangeLanguage extends LanguageChangedEvent {
  final String languageCode;
 const ChangeLanguage({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}

