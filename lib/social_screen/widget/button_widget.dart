import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_30/Images/resources.dart';
import 'package:flutter_project_30/theme/colors.dart';
import 'package:flutter_project_30/theme/text_style.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(
                  color: AppColors.color000000.withOpacity(0.12),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ADD FRIEND',
                  style: TextStyles.roboto14w500.copyWith(color: Colors.black),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  Images.flexibleBlack,
                  scale: 4,
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Divider(
          height: 1,
          color: AppColors.color212121.withOpacity(0.08),
          // color: AppColors.color000000,
          indent: 18,
          endIndent: 18,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
