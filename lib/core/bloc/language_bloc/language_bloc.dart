import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../utils/enum.dart';
import 'language_event.dart';

class LanguageBloc extends Bloc<LanguageEvent, Language> {
  static const _storageKey = 'app_language';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  LanguageBloc() : super(Language.english) {
    on<LoadLanguage>(_loadLanguage);
    on<ChangeLanguage>(_changeLanguage);
  }

  Future<void> _loadLanguage(
      LoadLanguage event,
      Emitter<Language> emit,
      ) async {
    final savedCode = await _storage.read(key: _storageKey);

    if (savedCode == null) {
      // First app launch → default EN
      emit(Language.english);
      await _storage.write(
        key: _storageKey,
        value: Language.english.code,
      );
    } else {
      emit(Language.fromCode(savedCode));
    }
  }

  Future<void> _changeLanguage(
      ChangeLanguage event,
      Emitter<Language> emit,
      ) async {
    emit(event.language);
    await _storage.write(
      key: _storageKey,
      value: event.language.code,
    );
  }
}
