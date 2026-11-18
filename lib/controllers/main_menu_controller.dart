import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pas/menu/home_page.dart';
import 'package:flutter_pas/menu/profile_page.dart';
import 'package:flutter_pas/menu/feat_page.dart';


class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changesPage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPages = [HomePage(),ProfilePage(),FeatPage()];

}