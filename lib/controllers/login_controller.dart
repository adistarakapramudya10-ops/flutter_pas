import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pas/pages/MainMenu_page.dart';
import 'package:flutter_pas/models/login_model.dart'; 

class LoginController extends GetxController {

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;

  var loginModel = Rxn<LoginModel>(); 

  void login() async {
    if (txtUsername.text.toString().isEmpty || txtPassword.text.toString().isEmpty) {
      Get.snackbar("error", "username dan password harus terisi");
    } else {
      try {
        isLoading.value = true;

        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(
          url,
          body: {
            "username": txtUsername.text.toString(),
            "password": txtPassword.text.toString(),
          },
        );

        isLoading.value = false;

        if (response.statusCode == 200) {

          loginModel.value = loginModelFromJson(response.body);

          if (loginModel.value?.status == true) {
            Get.snackbar("berhasil", loginModel.value?.message ?? "Login success");
            Get.offAll(() => MainMenuPage());
          } else {
            Get.snackbar("gagal", loginModel.value?.message ?? "Login gagal");
          }
        } else {
          Get.snackbar("error", "cek internet connection / server error");
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar("gagal", e.toString());
        debugPrint("error: " + e.toString());
      }
    }
  }
}