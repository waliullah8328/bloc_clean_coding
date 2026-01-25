import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonTitle;
  



  const LoginButton({super.key, this.onPressed, required this.buttonTitle, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(buttonTitle),
    );
  }
}
