import 'package:bloc_clean_coding/core/repository/auth/authentication_moc_api_repository.dart';
import 'package:bloc_clean_coding/core/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'feature/app.dart';
 GetIt getIt = GetIt.instance;


void main() {

  servicesLocator();
  runApp(const MyApp());
}

void servicesLocator(){
  getIt.registerLazySingleton<AuthenticationRepository>(()=> AuthenticationMocApiRepository());
}




