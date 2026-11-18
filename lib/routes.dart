import 'package:flutter_pas/pages/details_page.dart';
import 'package:flutter_pas/pages/listmakanan_page.dart';
import 'package:flutter_pas/pages/MainMenu_page.dart';
import 'package:flutter_pas/login_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String listMakanan = '/list_makanan';
  static const String detailMakanan = '/detail_makanan';
  static const String mainMenu = '/main_menu';
  static const String loginpage = '/loginpage';

  static final myPages = [
    GetPage(name: listMakanan, page: () => ListMakananPage()),
    GetPage(name: detailMakanan, page: () => DetailsPage()), 
    GetPage(name: mainMenu, page: () => MainMenuPage()), 
    GetPage(name: loginpage, page: () => LoginPage()),
  ];
}
