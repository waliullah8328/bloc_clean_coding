import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  static const _storageKey = 'theme_mode';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ThemeBloc() : super(ThemeMode.system) {
    on<LoadTheme>(_loadTheme);
    on<ToggleTheme>(_toggleTheme);
    on<SetTheme>(_setTheme);
  }

  Future<void> _loadTheme(
      LoadTheme event,
      Emitter<ThemeMode> emit,
      ) async {
    final saved = await _storage.read(key: _storageKey);

    switch (saved) {
      case 'light':
        emit(ThemeMode.light);
        break;
      case 'dark':
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  Future<void> _toggleTheme(
      ToggleTheme event,
      Emitter<ThemeMode> emit,
      ) async {
    final newTheme =
    state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    emit(newTheme);

    await _storage.write(
      key: _storageKey,
      value: newTheme == ThemeMode.light ? 'light' : 'dark',
    );
  }

  Future<void> _setTheme(
      SetTheme event,
      Emitter<ThemeMode> emit,
      ) async {
    emit(event.mode);

    final value = event.mode == ThemeMode.light
        ? 'light'
        : event.mode == ThemeMode.dark
        ? 'dark'
        : 'system';

    await _storage.write(
      key: _storageKey,
      value: value,
    );
  }
}
