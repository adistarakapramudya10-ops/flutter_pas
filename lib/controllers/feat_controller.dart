import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pas/models/team_model.dart';

class FeatController extends GetxController {
  var isLoading = true.obs;
  var teamList = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  void fetchTeams() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(
        "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League",
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = premierLeagueModelFromJson(response.body);
        teamList.assignAll(data.teams);
      } else {
        Get.snackbar("Error", "Gagal mengambil data klub (${response.statusCode})");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
      debugPrint("Error fetchTeams: $e");
    } finally {
      isLoading.value = false;
    }
  }
}