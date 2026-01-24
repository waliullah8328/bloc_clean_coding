
import 'package:bloc_clean_coding/feature/login/view/%20model/user_model.dart';

import 'authentication_repository.dart';

class AuthenticationMocApiRepository implements AuthenticationRepository{

  @override
  Future<UserModel> loginApi(dynamic data) async {

    await Future.delayed( Duration(seconds: 3));

    final response = {
      'success':"Login successful",
      'token':'adljogjogjpg',
    };
    return UserModel.fromJson(response);
  }

}