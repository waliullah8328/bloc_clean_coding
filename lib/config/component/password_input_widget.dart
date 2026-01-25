import 'package:flutter/material.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? toglePressed;

  final void Function(String)? onFieldSubmitted;

  final bool obscureText ;
  const PasswordInputWidget({
    super.key,
    required this.passwordFocusNode,
    this.onChanged,
    this.validator,
    this.toglePressed,
    this.obscureText = true,
  this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: passwordFocusNode,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted:  onFieldSubmitted,
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: toglePressed,
        ),
        prefixIcon: const Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
