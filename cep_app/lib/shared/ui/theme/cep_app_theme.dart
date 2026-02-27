import 'package:cep_app/shared/ui/cep_app_color.dart';
import 'package:flutter/material.dart';

sealed class CepAppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CepAppColor.primaryColor,
      onPrimary: CepAppColor.primaryColor,
      secondary: CepAppColor.secondaryColor,
      onSecondary: CepAppColor.secondaryColor,
      error: CepAppColor.errorColor,
      onError: CepAppColor.errorColor,
      surface: CepAppColor.lightBgColor,
      onSurface: CepAppColor.lightBgColor,
    ),
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: Colors.black,
      labelColor: CepAppColor.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CepAppColor.lightBgColor,
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: CepAppColor.primaryColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: CepAppColor.primaryColor,
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all(
        Colors.white,
      ),
      thumbColor: const WidgetStatePropertyAll(
        CepAppColor.primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CepAppColor.primaryColor,
      titleTextStyle: TextStyle(
        color: CepAppColor.secondaryColor,
        fontSize: 16,
      ),
    ),
    scaffoldBackgroundColor: CepAppColor.lightBgColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: CepAppColor.blackColor,
        fontSize: 14,
      ),
      titleMedium: TextStyle(
        color: CepAppColor.blackColor,
        fontSize: 20,
      ),
    ),
  );

  static final ThemeData dark = light.copyWith(
    tabBarTheme: TabBarThemeData(
      unselectedLabelColor: Colors.grey,
      labelColor: CepAppColor.primaryColor,
    ),
    appBarTheme: light.appBarTheme.copyWith(
      backgroundColor: Colors.black87,
    ),
    scaffoldBackgroundColor: CepAppColor.darkBgColor,
    brightness: Brightness.dark,
    colorScheme: light.colorScheme.copyWith(
      brightness: Brightness.dark,
      surface: CepAppColor.darkBgColor,
      onSurface: CepAppColor.darkBgColor,
    ),
    textTheme: light.textTheme.copyWith(
      bodyMedium: light.textTheme.bodyMedium!.copyWith(
        color: CepAppColor.whiteColor,
      ),
      titleMedium: light.textTheme.titleMedium!.copyWith(
        color: CepAppColor.whiteColor,
      ),
    ),
    inputDecorationTheme: light.inputDecorationTheme.copyWith(
      fillColor: CepAppColor.blackColor,
    ),
  );
}
