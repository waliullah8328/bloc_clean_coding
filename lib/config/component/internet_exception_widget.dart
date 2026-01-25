import 'package:bloc_clean_coding/config/color/app_colors.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({super.key, this.onPressed});

  final  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.15),
        Icon(Icons.cloud_off, color: AppColors.primary, size: 50),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We're unable to show results.\nPlease check your data\nconnection",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),

        ElevatedButton(onPressed:onPressed, child: Text('Retry')),
      ],
    );
  }
}
