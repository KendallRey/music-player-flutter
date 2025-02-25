import 'package:flutter/material.dart';
import 'package:music_player/app/router.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Color darkActionColor = Color.fromARGB(255, 28, 148, 204);
  final Color darkUnselectedColor = Color.fromARGB(255, 246, 246, 246);
  final Color darkShadeColor = Colors.black38;
  final Color darkFocusedColor = Colors.yellow;
  final Color darkGenericColor = Color.fromARGB(255, 22, 22, 22);
  final Color darkDisabledColor = Colors.blueGrey;
  final Color darkErrorColor = Colors.red;
  final Color darkErrorFocusColor = Colors.redAccent;
  final Color darkTextColor = Color.fromARGB(255, 246, 246, 246);

  final Color lightActionColor = Color.fromARGB(255, 37, 179, 245);
  final Color lightUnselectedColor = Color.fromARGB(255, 93, 93, 93);
  final Color lightShadeColor = Colors.white38;
  final Color lightFocusedColor = Color.fromARGB(255, 120, 212, 250);
  final Color lightGenericColor = Colors.white;
  final Color lightDisabledColor = Colors.blueGrey;
  final Color lightErrorColor = Colors.red;
  final Color lightErrorFocusColor = Colors.redAccent;
  final Color lightTextColor = Color.fromARGB(255, 46, 46, 46);

  WidgetStateProperty<Color?> stateColorBackgroundDarkMode() {
    return WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.disabled)) {
        return darkDisabledColor;
      }
      return darkActionColor;
    });
  }

  WidgetStateProperty<Color?> stateColorBackgroundLightMode() {
    return WidgetStateProperty.resolveWith((state) {
      if (state.contains(WidgetState.disabled)) {
        return lightDisabledColor;
      }
      return lightActionColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      theme: ThemeData.light().copyWith(
        primaryColor: lightActionColor,
        primaryColorDark: lightShadeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightActionColor,
          foregroundColor: lightGenericColor,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          foregroundColor: stateColorBackgroundLightMode(),
        )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: lightActionColor,
            unselectedItemColor: lightUnselectedColor,
            backgroundColor: lightActionColor),
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStateProperty.all(lightActionColor),
          fillColor: WidgetStateProperty.all(Colors.transparent),
          side: BorderSide(color: lightActionColor, width: 2),
        ),
        unselectedWidgetColor: lightActionColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: lightActionColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: stateColorBackgroundLightMode(),
            foregroundColor: WidgetStateProperty.all(lightGenericColor),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: lightActionColor,
          foregroundColor: lightGenericColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightActionColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightFocusedColor),
            ),
            focusColor: darkFocusedColor,
            labelStyle: TextStyle(color: lightActionColor),
            floatingLabelStyle: TextStyle(color: lightActionColor),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightErrorColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightErrorFocusColor),
            )),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: lightTextColor),
          displayMedium: TextStyle(color: lightTextColor),
          displaySmall: TextStyle(color: lightTextColor),
          headlineLarge: TextStyle(color: lightTextColor),
          headlineMedium: TextStyle(color: lightTextColor),
          headlineSmall: TextStyle(color: lightTextColor),
          titleLarge: TextStyle(color: lightTextColor),
          titleMedium: TextStyle(color: lightTextColor),
          titleSmall: TextStyle(color: lightTextColor),
          bodyLarge: TextStyle(color: lightTextColor),
          bodyMedium: TextStyle(color: lightTextColor),
          bodySmall: TextStyle(color: lightTextColor),
          labelLarge: TextStyle(color: lightTextColor),
          labelMedium: TextStyle(color: lightTextColor),
          labelSmall: TextStyle(color: lightTextColor),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: darkActionColor,
        primaryColorDark: darkShadeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: darkActionColor,
          foregroundColor: lightGenericColor,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          foregroundColor: stateColorBackgroundDarkMode(),
        )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: darkActionColor,
            unselectedItemColor: darkUnselectedColor,
            backgroundColor: darkActionColor),
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStateProperty.all(darkActionColor),
          fillColor: WidgetStateProperty.all(Colors.transparent),
          side: BorderSide(color: darkActionColor, width: 2),
        ),
        unselectedWidgetColor: darkActionColor,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: darkActionColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: stateColorBackgroundDarkMode(),
            foregroundColor: WidgetStateProperty.all(lightGenericColor),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkActionColor,
          foregroundColor: lightGenericColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkActionColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkFocusedColor),
            ),
            focusColor: darkFocusedColor,
            labelStyle: TextStyle(color: darkActionColor),
            floatingLabelStyle: TextStyle(color: darkActionColor),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkErrorColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: darkErrorFocusColor),
            )),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: darkTextColor),
          displayMedium: TextStyle(color: darkTextColor),
          displaySmall: TextStyle(color: darkTextColor),
          headlineLarge: TextStyle(color: darkTextColor),
          headlineMedium: TextStyle(color: darkTextColor),
          headlineSmall: TextStyle(color: darkTextColor),
          titleLarge: TextStyle(color: darkTextColor),
          titleMedium: TextStyle(color: darkTextColor),
          titleSmall: TextStyle(color: darkTextColor),
          bodyLarge: TextStyle(color: darkTextColor),
          bodyMedium: TextStyle(color: darkTextColor),
          bodySmall: TextStyle(color: darkTextColor),
          labelLarge: TextStyle(color: darkTextColor),
          labelMedium: TextStyle(color: darkTextColor),
          labelSmall: TextStyle(color: darkTextColor),
        ),
      ),
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
    );
  }
}
