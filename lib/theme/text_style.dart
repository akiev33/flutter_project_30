import 'package:flutter/material.dart';
import 'package:flutter_project_30/theme/colors.dart';

abstract class TextStyles {
  static TextStyle roboto20w500 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  static TextStyle roboto16w400 = const TextStyle(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  static TextStyle roboto12w400 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.5,
  );
  static TextStyle roboto14w400 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static TextStyle listTile = const TextStyle(
    fontSize: 16,
    letterSpacing: 0.15,
  );
  static TextStyle listTile2 = TextStyle(
      fontSize: 16,
      letterSpacing: 0.15,
      color: AppColors.color000000.withOpacity(0.6));

  static TextStyle roboto14w500 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  );
  static TextStyle roboto24w400 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.25,
  );
}
