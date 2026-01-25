import 'package:bloc_clean_coding/core/repository/auth/authentication_moc_api_repository.dart';
import 'package:bloc_clean_coding/core/repository/reciters/reciter_api_repository.dart';
import 'package:bloc_clean_coding/core/repository/reciters/reciter_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/bloc/language_bloc/language_bloc.dart';
import 'core/bloc/language_bloc/language_event.dart';
import 'core/bloc/theme_bloc/theme_bloc.dart';
import 'core/bloc/theme_bloc/theme_event.dart';
import 'core/repository/auth/authentication_repository.dart';
import 'feature/app.dart';
 GetIt getIt = GetIt.instance;


void main() {

  servicesLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (_) => ThemeBloc(),
      ),
      BlocProvider<LanguageBloc>(
        create: (_) => LanguageBloc()..add(LoadLanguage()),
      ),
    ],
    child:  const MyApp(),
  ));
}

void servicesLocator(){
  getIt.registerLazySingleton<AuthenticationRepository>(()=> AuthenticationMocApiRepository());
  getIt.registerLazySingleton<ReciterRepository>(()=> ReciterApiRepository());
}




