import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../config/route/route.dart';
import 'package:bloc_clean_coding/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:bloc_clean_coding/core/bloc/language_bloc/language_bloc.dart';


import '../core/utils/enum.dart';
import '../l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<LanguageBloc, Language>(
          builder: (context, language) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Bloc Clean Code',

              /// 🔹 ROUTER
              routerConfig: Routes.goRouter,

              /// 🔹 THEME
              themeMode: themeMode,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),

              /// 🔹 LANGUAGE (THIS IS THE KEY)
              locale: Locale(language.code),

              /// 🔹 LOCALIZATION
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
            );
          },
        );
      },
    );
  }
}
