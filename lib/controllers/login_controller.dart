import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pas/routes.dart';
import 'package:flutter_pas/models/login_model.dart';

class LoginController extends GetxController {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.trim().isEmpty || txtPassword.text.trim().isEmpty) {
      Get.snackbar("Error", "Username dan password harus terisi");
      return;
    }

    try {
      isLoading.value = true;

      final url = Uri.parse("https://mediadwi.com/api/latihan/login");

      final response = await http.post(
        url,
        body: {
          "username": txtUsername.text.trim(),
          "password": txtPassword.text.trim(),
        },
      );

      isLoading.value = false;

      if (response.statusCode == 200) {
        loginModel.value = loginModelFromJson(response.body);

        if (loginModel.value?.status == true) {
          Get.snackbar("Berhasil", loginModel.value?.message ?? "Login success");
          Get.offAllNamed(Routes.mainMenu);
        } else {
          Get.snackbar("Gagal", loginModel.value?.message ?? "Login gagal");
        }
      } else {
        Get.snackbar("Error", "Cek koneksi internet / server error");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Gagal", e.toString());
      debugPrint("error: $e");
    }
  }
}