import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pas/models/makanan_model.dart'; 

class ListMakananController extends GetxController {

  var listMakanan = <MakananModel>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataMakanan(); 
  }

  void fetchDataMakanan() async {
    try {
      isLoading.value = true;

      final url = Uri.parse('https://api.npoint.io/dc9ce3557046a60751a5');
      final response = await http.get(url);

      if (response.statusCode == 200) {

        var data = makananModelFromJson(response.body);

        listMakanan.assignAll(data);
      } else {
        Get.snackbar("Error", "Gagal mengambil data dari server");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
      print("Error fetch data: $e");
    } finally {

      isLoading.value = false; 
    }
  }
}