import 'package:flutter/material.dart';
import 'package:mobile_application/basic_module/font_theme.dart';
import 'package:mobile_application/basic_module/main_screen.dart';
import 'package:mobile_application/basic_module/theme_screen.dart';
import 'package:provider/provider.dart';




class BasicApp extends StatelessWidget {
  // const BasicApp({super.key});
  double _size = 0;
  @override
  Widget build(BuildContext context) {
    bool dark = context.watch<ThemeLogic>().dark;
    _size = context.watch<FontLogic>().size;
    return MaterialApp(
      home: MainScreen(),
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
    );
  }

  ThemeData _darkTheme(){
    // Color col1 = const Color.fromARGB(255, 234, 32, 17);
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: _size)),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.pink.shade400,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.pink.shade400,
        unselectedItemColor: Colors.black, 
      ),
      drawerTheme:DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      listTileTheme: ListTileThemeData(
        textColor: Colors.white,
        iconColor: Colors.pink.shade400,
      ),

    );
  }

  ThemeData _lightTheme(){
    Color col1 = Colors.pink.shade500;
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(bodyMedium: TextStyle(fontSize: _size)),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: col1,
        unselectedItemColor: Colors.grey, 
      ),
      drawerTheme:DrawerThemeData(
        backgroundColor: Colors.white,
      ),

    );
  }
}