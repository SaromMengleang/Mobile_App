import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier{
  bool _dark = false;
  bool get dark => _dark;

  void setDark(bool value){
    _dark = value;
    notifyListeners();
  }

  void changeToDark(){
    _dark = true;
    notifyListeners();
  }

  void changeToLight(){
    _dark = false;
    notifyListeners();
  }
}