import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pas/controllers/main_menu_controller.dart'; 

class MainMenuPage extends StatelessWidget {

  final MainMenuController _controller = Get.put(MainMenuController());

  MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: _controller.selectedIndex.value, 
          children: _controller.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _controller.changesPage,
          currentIndex: _controller.selectedIndex.value, 
          selectedItemColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.featured_play_list_outlined),
              label: "Feat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}