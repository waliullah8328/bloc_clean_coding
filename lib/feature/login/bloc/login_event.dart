part of 'login_block.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailUnFocused extends LoginEvent {}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordUnFocused extends LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}

class SubmitButton extends LoginEvent {}
