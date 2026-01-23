import 'package:flutter/material.dart';
import 'package:tredo/core/style/repo.dart';

class AppStyle {
  static ThemeData get theme {
    return ThemeData(
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: StyleRepo.deepGreen,
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: StyleRepo.white),
      ),
      primaryColor: StyleRepo.orange,
      scaffoldBackgroundColor: StyleRepo.white,
      navigationBarTheme: NavigationBarThemeData(
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: StyleRepo.green);
          }
          return IconThemeData(color: StyleRepo.grey);
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          backgroundColor: WidgetStatePropertyAll(StyleRepo.deepGreen),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: StyleRepo.deepGrey,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        errorStyle: TextStyle(
          color: StyleRepo.red,
          fontWeight: FontWeight.w500,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: StyleRepo.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: StyleRepo.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: StyleRepo.deepGreen, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: StyleRepo.red),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
