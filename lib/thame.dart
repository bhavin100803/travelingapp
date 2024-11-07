import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelbuddy/colors.dart';

class UiProvider extends ChangeNotifier {

  bool _isdark = false;
  bool get isDark => _isdark;

  final darkTheme = ThemeData(
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      primaryColorDark: Colors.black,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.blue)

  );
  final lightTheme = ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.light,
      primaryColorDark: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.red)
  );

  changeTheme(){

    _isdark =  !isDark;
    notifyListeners();
  }

  init(){
    notifyListeners();
  }

}

class IncrementDecrement extends ChangeNotifier {
  int item = 1;
  int item_2 = 2;

  void incrementItem() {
    item++;
    notifyListeners();
  }

  void decrementItem() {
    if (item > 1) {
      item--;
      notifyListeners();
    }
  }

  void incrementItem2() {
    item_2++;
    notifyListeners();
  }

  void decrementItem2() {
    if (item_2 > 1) {
      item_2--;
      notifyListeners();
    }
  }

  bool canDecrementItem() => item > 1;
  bool canDecrementItem2() => item_2 > 1;
}