class PembayaranModel {
  final String id;
  final String namaEvent;
  final String tanggal;
  final double harga;
  final String deskripsi;
  final String imageUrl; // Pastikan baris ini ada

  PembayaranModel({
    required this.id,
    required this.namaEvent,
    required this.tanggal,
    required this.harga,
    this.deskripsi = 'Deskripsi event belum tersedia.',
    required this.imageUrl, // Pastikan baris ini ada
  });
}

class PesananModel {
  final PembayaranModel tiket;
  final int jumlah;
  final double totalHarga;

  PesananModel({
    required this.tiket,
    required this.jumlah,
    required this.totalHarga,
  });
}