import 'package:flutter/material.dart';

class MenuDrawerController extends ChangeNotifier {

  String _userName = "Adista Raka Pramudya";
  String _userEmail = "adistarakapramudya10@gmail.com";

  String get userName => _userName;
  String get userEmail => _userEmail;
  
  void updateUserData(String name, String email) {
    _userName = name;
    _userEmail = email;
    notifyListeners();
  }

  void navigateTo(BuildContext context, String routeName) {
    Navigator.pop(context); 
    Navigator.pushNamed(context, routeName);
  }
}