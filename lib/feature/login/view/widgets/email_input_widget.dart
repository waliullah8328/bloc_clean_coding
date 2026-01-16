import 'package:flutter/material.dart';

class EmailInputWidget extends StatelessWidget {

  final FocusNode emailFocusNode;

  final void Function(String)? onChanged;
  const EmailInputWidget({super.key, required this.emailFocusNode, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                
                focusNode: emailFocusNode,
                
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: onChanged,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              );
  }
}