import 'package:flutter/material.dart';
import 'package:mobile_application/basic_module/login.dart';
// import 'package:mobile_application/basic_module/main_screen.dart';
import 'font_theme.dart';
import 'package:provider/provider.dart';
import 'theme_screen.dart';


class BasicApp extends StatelessWidget {
  double _size = 0;

  BasicApp({super.key});
  @override
  Widget build(BuildContext context) {
    _size = context.watch<FontLogic>().size;

    int themeIndex = context.watch<ThemeLogic>().themeIndex;
    ThemeMode mode = ThemeMode.system;
    switch (themeIndex) {
      case 1:
        mode = ThemeMode.dark;
        break;
      case 2:
        mode = ThemeMode.light;
        break;
      default:
        mode = ThemeMode.system;
    }
    return MaterialApp(
      home: LoginPage(),
      themeMode: mode,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
    );
    
  }

  ThemeData _lightTheme() {
    Color col1 = Color.fromARGB(255, 162, 4, 138);
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: _size)),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: col1,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: col1,
        unselectedItemColor: Colors.grey,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
    );
  }

  ThemeData _darkTheme() {
    Color col1 = Colors.pink;
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: _size)),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: col1,
        unselectedItemColor: Colors.grey,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.black),
      listTileTheme: ListTileThemeData(
        textColor: Colors.white,
        iconColor: col1,
      ),
    );
  }
}