import '../../utils/enum.dart';

abstract class LanguageEvent {}

class LoadLanguage extends LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final Language language;
  ChangeLanguage(this.language);
}
