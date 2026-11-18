import 'package:flutter/material.dart';
import 'package:flutter_pas/controllers/listmakanan_controller.dart';
import 'package:flutter_pas/routes.dart';
import 'package:get/get.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 176, 192, 194),
      appBar: AppBar(
        title: const Text("List Makanan"),
        backgroundColor: const Color.fromARGB(255, 226, 10, 10),
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }

            if (controller.listMakanan.isEmpty) {
              return const Center(
                child: Text("Tidak ada data makanan"),
              );
            }

            return ListView.builder(
              itemCount: controller.listMakanan.length,
              itemBuilder: (context, index) {
                final makanan = controller.listMakanan[index];
                return Dismissible(
                  key: ValueKey(makanan.namaMakanan),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => controller.listMakanan.removeAt(index),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () => Get.toNamed(
                      Routes.detailMakanan,
                      arguments: {
                        'namaMakanan': makanan.namaMakanan,
                        'hargaMakanan': makanan.hargaMakanan,
                        'gambarMakanan': makanan.gambarMakanan,
                        'deskripsiMakanan': makanan.deskripsiMakanan,
                        'ratingMakanan': makanan.ratingMakanan,
                        'reviewMakanan': makanan.reviewMakanan,
                      },
                    ),
                    child: Card(
                      color: Colors.orange.shade50,
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          makanan.namaMakanan,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          makanan.hargaMakanan,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 228, 12, 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}