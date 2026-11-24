import 'dart:convert';

List<MakananModel> makananModelFromJson(String str) => List<MakananModel>.from(json.decode(str).map((x) => MakananModel.fromJson(x)));

String makananModelToJson(List<MakananModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MakananModel {
  final String namaMakanan;
  final String hargaMakanan;
  final String gambarMakanan;
  final String deskripsiMakanan;
  final double harga;
  final int ratingMakanan;
  final String reviewMakanan;

  MakananModel({
    required this.namaMakanan,
    required this.hargaMakanan,
    required this.gambarMakanan,
    required this.deskripsiMakanan,
    required this.harga,
    required this.ratingMakanan,
    required this.reviewMakanan,
  });

  factory MakananModel.fromJson(Map<String, dynamic> json) => MakananModel(
        namaMakanan: json["namaMakanan"],
        hargaMakanan: json["hargaMakanan"] ?? "Rp ${json["harga"]}", // Fallback jika kosong
        gambarMakanan: json["gambarMakanan"],
        deskripsiMakanan: json["deskripsiMakanan"],
        harga: json["harga"].toDouble(),
        ratingMakanan: json["ratingMakanan"],
        reviewMakanan: json["reviewMakanan"],
      );

  Map<String, dynamic> toJson() => {
        "namaMakanan": namaMakanan,
        "hargaMakanan": hargaMakanan,
        "gambarMakanan": gambarMakanan,
        "deskripsiMakanan": deskripsiMakanan,
        "harga": harga,
        "ratingMakanan": ratingMakanan,
        "reviewMakanan": reviewMakanan,
      };
}

class PesananModel {
  final MakananModel makanan; // Diubah dari 'tiket' ke 'makanan'
  final int jumlah;
  final double totalHarga;

  PesananModel({
    required this.makanan,
    required this.jumlah,
    required this.totalHarga,
  });
}