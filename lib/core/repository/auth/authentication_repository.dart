import 'package:bloc_clean_coding/feature/login/view/%20model/user_model.dart';

abstract class AuthenticationRepository{

  Future<UserModel> loginApi(dynamic data) ;

}