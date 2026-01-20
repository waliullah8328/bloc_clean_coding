part of 'login_block.dart';

class LoginStates extends Equatable {
  const LoginStates({
    this.email = '',
    this.password = '',
    this.isObscure = true,
    this.postApiStatus = PostApiStatus.initial,
    this.error = '',
  });

  final String email;
  final String password;
  final bool isObscure;
  final PostApiStatus postApiStatus;
  final String error;

  LoginStates copyWith({
    String? email,
    String? password,
    bool? isObscure,
    PostApiStatus? postApiStatus,
    String? error,
  })
 {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      isObscure: isObscure ?? this.isObscure,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [email, password, isObscure, postApiStatus,error];
}
