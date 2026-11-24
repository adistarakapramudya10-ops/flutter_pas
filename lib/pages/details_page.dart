import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pas/models/makanan_model.dart';
import 'package:flutter_pas/controllers/home.controller.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  final HomeController homeC = Get.put(HomeController());
  final MakananModel makanan = Get.arguments;
  final RxInt jumlahPesanan = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 248),
      appBar: AppBar(
        title: const Text("Transaksi Pembelian"),
        backgroundColor: const Color.fromARGB(255, 226, 10, 10),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 230,
              color: Colors.white,
              child: Image.network(
                makanan.gambarMakanan,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.red),
                  );
                },
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.fastfood, size: 64, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    makanan.namaMakanan,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 40, 40, 40),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Rp ${makanan.harga.toInt()}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 228, 12, 12),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Divider(thickness: 1.5),
                  ),
                  const Text(
                    "Deskripsi Makanan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    makanan.deskripsiMakanan,
                    style: const TextStyle(fontSize: 14, color: Colors.black54, height: 1.4),
                  ),
                  const SizedBox(height: 20),

                  // Rincian Perhitungan Sesuai Rumus Soal (Subtotal, PPN 5%, Total Bayar)
                  Obx(() {
                    double subtotal = makanan.harga * jumlahPesanan.value;
                    double ppn = subtotal * 0.05;
                    double totalBayar = subtotal + ppn;

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Harga Satuan', style: TextStyle(fontSize: 16)),
                                  Text(
                                    'Rp ${makanan.harga.toInt()}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Jumlah Makanan', style: TextStyle(fontSize: 16)),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                                        onPressed: () {
                                          if (jumlahPesanan.value > 1) jumlahPesanan.value--;
                                        },
                                      ),
                                      Text(
                                        '${jumlahPesanan.value}',
                                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add_circle_outline, color: Colors.green.shade600),
                                        onPressed: () => jumlahPesanan.value++,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Subtotal', style: TextStyle(fontSize: 16)),
                                  Text('Rp ${subtotal.toInt()}', style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('PPN (5%)', style: TextStyle(fontSize: 16, color: Colors.orange)),
                                  Text(
                                    'Rp ${ppn.toInt()}',
                                    style: const TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const Divider(height: 24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Bayar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text(
                                    'Rp ${totalBayar.toInt()}',
                                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 226, 10, 10),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () => homeC.bayarMakanan(
                              makanan,
                              jumlahPesanan.value,
                              subtotal,
                              ppn,
                              totalBayar,
                            ),
                            child: const Text(
                              'Bayar',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}