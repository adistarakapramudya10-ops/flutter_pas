import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pas/controllers/feat_controller.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});

  final FeatController featC = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 248),
      appBar: AppBar(
        title: const Text("English Premier League"),
        backgroundColor: const Color.fromARGB(255, 56, 0, 60), // Warna khas EPL
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Obx(() {
        if (featC.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (featC.teamList.isEmpty) {
          return const Center(
            child: Text("Data klub tidak ditemukan."),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: featC.teamList.length,
          itemBuilder: (context, index) {
            final team = featC.teamList[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    team.strBadge,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.shield, size: 40, color: Colors.grey),
                  ),
                ),
                title: Text(
                  team.strTeam,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.stadium, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          team.strStadium,
                          style: const TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}