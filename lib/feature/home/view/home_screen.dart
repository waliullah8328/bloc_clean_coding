import 'package:bloc_clean_coding/core/utils/storage/local_storage.dart';
import 'package:bloc_clean_coding/data/exceptions/app_exceptions.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../config/route/app_route_name.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      floatingActionButton: IconButton(onPressed: (){
        throw NoInternetException();
      }, icon:Icon(Icons.add)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {
              context.push(AppRouteNames.reciterScreen);
            }, child: Text("Home")),
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
