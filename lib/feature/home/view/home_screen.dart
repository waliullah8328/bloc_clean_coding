import 'package:bloc_clean_coding/core/utils/storage/local_storage.dart';

import 'package:bloc_clean_coding/feature/home/view/widget/animated_theme_switch.dart';
import 'package:bloc_clean_coding/l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../../config/route/app_route_name.dart';
import '../../../core/bloc/language_bloc/language_bloc.dart';
import '../../../core/bloc/language_bloc/language_event.dart';
import '../../../core/utils/enum.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Build");

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AnimatedThemeSwitch(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            BlocSelector<LanguageBloc, Language, Language>(
              selector: (state) => state,
              builder: (context, language) {
                return DropdownButton<Language>(
                  value: language,
                  items: Language.values.map((lang) => DropdownMenuItem(
                    value: lang,
                    child: Text(lang.name),
                  )).toList(),
                  onChanged: (lang) {
                    if (lang != null) {
                      context.read<LanguageBloc>().add(ChangeLanguage(lang));
                    }
                  },
                );
              },
            )
            ,



            TextButton(onPressed: () {
              context.push(AppRouteNames.reciterScreen);
            }, child: Text(AppLocalizations.of(context)!.home)),
            Text("Hello world"),
            Text("Nice to meet you"),

            TextButton(onPressed: (){

              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue(key: 'token').then((value){
                localStorage.clearValue(key: "isLogin").then((value){
                  if(!context.mounted)return;
                  context.go(AppRouteNames.loginScreen);
                });
              });

            }, child: Text("Log Out"))

          ],
        ),
      ),
    );
  }
}
