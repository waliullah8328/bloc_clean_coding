import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/core/utils/post_api_status.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<TogglePasswordVisibility>(_onChangePasswordVisibility);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onChangePasswordVisibility(TogglePasswordVisibility event, Emitter<LoginStates> emit) {
    emit(state.copyWith(isObscure:!state.isObscure));
  }
}
