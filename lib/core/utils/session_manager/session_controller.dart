import 'dart:convert';

import 'package:bloc_clean_coding/core/utils/storage/local_storage.dart';
import 'package:bloc_clean_coding/feature/login/view/%20model/user_model.dart';
import 'package:flutter/material.dart';

class SessionController{

  static final SessionController _session = SessionController._internal();


  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  SessionController._internal(){
    isLogin = false;
  }

  factory SessionController(){
    return _session;
  }

  Future<void> getUserFromPreference()async{

    try{
      var userData = await localStorage.readValue(key: 'token');
      var isLogin = await localStorage.readValue(key: 'isLogin');

      if(userData.isNotEmpty){
        SessionController().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == 'true'?true:false;
    }
    catch(e){
      debugPrint(e.toString());
    }

  }

  Future<void> saveUserInPreference(dynamic user)async{

    localStorage.setValue(key: "token", value: jsonEncode(user));
    localStorage.setValue(key: 'isLogin', value: 'true');

  }
}