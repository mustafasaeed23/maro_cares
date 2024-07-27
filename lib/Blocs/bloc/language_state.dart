part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final String language;

  const LanguageState({required this.language});

  factory LanguageState.initial() {
    return LanguageState(language: 'en'); // Default language
  }

  LanguageState copyWith({String? language}) {
    return LanguageState(
      language: language ?? this.language,
    );
  }

  @override
  List<Object> get props => [language];
}

