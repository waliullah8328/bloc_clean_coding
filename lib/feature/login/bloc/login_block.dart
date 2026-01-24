import 'package:bloc/bloc.dart';

import 'package:bloc_clean_coding/core/utils/enum.dart';
import 'package:bloc_clean_coding/core/utils/session_manager/session_controller.dart';
import 'package:equatable/equatable.dart';

import '../../../core/repository/auth/authentication_repository.dart';

part 'login_event.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {

  AuthenticationRepository authenticationRepository;
  LoginBloc({required this.authenticationRepository}) : super(LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<TogglePasswordVisibility>(_onChangePasswordVisibility);
    on<SubmitButton>(_loginApi);
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

  Future<void> _loginApi(SubmitButton event, Emitter<LoginStates> emit) async {
    Map data = {"email": state.email,"password":state.password};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await authenticationRepository.loginApi(data).then((value) async {
      if(value.error.isNotEmpty){
        emit(state.copyWith(error: value.error.toString(),postApiStatus: PostApiStatus.error));

      }else{
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();
        emit(state.copyWith(successMessage: value.success.toString(),postApiStatus: PostApiStatus.success));

      }

    }).catchError((error){
      emit(state.copyWith(error: error.toString(),postApiStatus: PostApiStatus.error));

    });


  }




}
