import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_block.dart';
import 'widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginStates>(
                  builder: (context, state) {
                    return EmailInputWidget(
                      emailFocusNode: _emailFocusNode,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          EmailChanged(email: value),
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 16),
                PasswordInputWidget(passwordFocusNode: _passwordFocusNode),

                SizedBox(height: 24),
                SizedBox(height: 24),

                LoginButton(
                  buttonTitle: "Login",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
