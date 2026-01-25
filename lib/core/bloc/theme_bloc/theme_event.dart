import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class LoadTheme extends ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

class SetTheme extends ThemeEvent {
  final ThemeMode mode;
  SetTheme(this.mode);
}
