import 'package:bloc_clean_coding/core/utils/enum.dart';

import 'package:bloc_clean_coding/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../config/route/app_route_name.dart';

import '../bloc/login_block.dart';
import 'widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;




  @override
  void initState() {
    _loginBloc = LoginBloc(authenticationRepository: getIt());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    debugPrint("Main build");
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Form(
          key: _loginBloc.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginStates>(
                  buildWhen: (previous, current) => previous.email != current.email,
                  builder: (context, state) {
                    debugPrint("Email build");
                    return EmailInputWidget(
                      emailFocusNode: _loginBloc.emailFocusNode,
                      onFieldSubmitted: (_){
                        FocusScope.of(context).requestFocus(_loginBloc.passwordFocusNode);
                      },
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          EmailChanged(email: value),
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 16),
                BlocBuilder<LoginBloc, LoginStates>(
                   buildWhen: (previous, current) => previous.password != current.password ||
                       previous.isObscure != current.isObscure,
                  builder: (context, state) {
                    debugPrint("Password build");
                    return PasswordInputWidget(
                      passwordFocusNode: _loginBloc.passwordFocusNode,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          PasswordChanged(password: value),
                        );
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obscureText: state.isObscure,
                      toglePressed: () {
                        context.read<LoginBloc>().add(
                          TogglePasswordVisibility(),
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 16),

                BlocListener<LoginBloc, LoginStates>(
                    listener: (context,state){
                      if(state.postApiStatus == PostApiStatus.error){
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.error.toString())));
                            
                      }
                      if(state.postApiStatus == PostApiStatus.success){
                        context.go(AppRouteNames.homeScreen);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()..showSnackBar(SnackBar(content: Text(state.successMessage.toString())));

                      }

                    },
                  child: BlocBuilder<LoginBloc, LoginStates>(
                      buildWhen: (previous, current) => previous.postApiStatus != current.postApiStatus,
                      builder: (context, state) {
                        debugPrint("Button build");
                        return state.postApiStatus == PostApiStatus.loading?CircularProgressIndicator():LoginButton(
                          buttonTitle: "Login",
                          onPressed: () {
                            if (_loginBloc.formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(SubmitButton ());

                              if(state.password.length < 6){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Password must be at least 6 characters long')),
                                );
                              }
                            }
                          },
                        );
                      }),
                )



                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
