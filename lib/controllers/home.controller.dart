import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pas/models/makanan_model.dart';

class HomeController extends GetxController {
  var pesananList = <PesananModel>[].obs;

  final List<MakananModel> listMakanan = [
    MakananModel(
      namaMakanan: "Nasi Goreng Spesial",
      hargaMakanan: "Rp 25.000",
      harga: 25000,
      gambarMakanan: "https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=500",
      deskripsiMakanan: "Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.",
      ratingMakanan: 5,
      reviewMakanan: "Bumbu rempahnya terasa banget, porsinya pas!",
    ),
    MakananModel(
      namaMakanan: "Ayam Bakar Madu",
      hargaMakanan: "Rp 30.000",
      harga: 30000,
      gambarMakanan: "https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?w=500",
      deskripsiMakanan: "Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.",
      ratingMakanan: 5,
      reviewMakanan: "Manis madunya meresap sampai ke tulang, sambalnya mantap.",
    ),
    MakananModel(
      namaMakanan: "Sate Ayam Madura",
      hargaMakanan: "Rp 28.000",
      harga: 28000,
      gambarMakanan: "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=500",
      deskripsiMakanan: "10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.",
      ratingMakanan: 5,
      reviewMakanan: "Daging ayamnya empuk dan bumbu kacangnya medok.",
    ),
    MakananModel(
      namaMakanan: "Mie Ayam Bakso",
      hargaMakanan: "Rp 20.000",
      harga: 20000,
      gambarMakanan: "https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=500",
      deskripsiMakanan: "Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.",
      ratingMakanan: 4,
      reviewMakanan: "Mienya kenyal dan baksonya terasa daging sapinya.",
    ),
    MakananModel(
      namaMakanan: "Es Teh Manis Jumbo",
      hargaMakanan: "Rp 8.000",
      harga: 8000,
      gambarMakanan: "https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=500",
      deskripsiMakanan: "Minuman teh melati segar dengan gula asli dan es batu kristal.",
      ratingMakanan: 5,
      reviewMakanan: "Segar banget diminum pas siang hari, ukurannya jumbo.",
    ),
  ];

  void bayarMakanan(MakananModel makanan, int jumlah, double subtotal, double ppn, double totalBayar) {
    pesananList.add(PesananModel(
      makanan: makanan,
      jumlah: jumlah,
      totalHarga: totalBayar,
    ));

    Get.defaultDialog(
      title: "Pembayaran Berhasil! 🎉",
      middleText:
          "Menu: ${makanan.namaMakanan} ($jumlah x)\n"
          "Subtotal: Rp ${subtotal.toInt()}\n"
          "PPN (5%): Rp ${ppn.toInt()}\n"
          "Total Bayar: Rp ${totalBayar.toInt()}",
      textConfirm: "Selesai",
      confirmTextColor: Colors.white,
      buttonColor: Colors.green.shade600,
      onConfirm: () {
        Get.back(); // Tutup dialog
        Get.back(); // Kembali ke halaman Home
      },
    );
  }
}