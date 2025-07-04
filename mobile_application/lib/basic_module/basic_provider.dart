import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_application/basic_module/font_theme.dart';
import 'package:mobile_application/basic_module/theme_screen.dart';



import 'basic_app.dart';

Widget basicProvider(){
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeLogic() ),
      ChangeNotifierProvider(
        create: (context) => FontLogic() )
    ],
    child: BasicApp(),
  );
}