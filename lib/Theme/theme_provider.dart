import 'package:flutter/material.dart';
import 'package:teachers/Theme/theme.dart';
bool mode=false;

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData=lightmode;
  ThemeData get themedata => _themeData;
  set themeData(ThemeData themedata){
    _themeData=themedata;
    notifyListeners();
  }
  void toggleTheme(){
    if(_themeData==lightmode){
      mode=true;
      _themeData=darkMode;
      notifyListeners();
    }
    else{
      _themeData=lightmode;
      mode=false;
      notifyListeners();
    }
  }
}