import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 248),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 2,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 58,
              backgroundColor: Colors.red.shade100,
              child: const CircleAvatar(
                radius: 54,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.person,
                  size: 64,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Adista Raka Pramudya",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 40, 40, 40),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "SMK Raden Umar Said Kudus",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),

            Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.badge, color: Colors.red),
                      title: Text(
                        "Nama Lengkap",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      subtitle: Text(
                        "Adista Raka Pramudya",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.class_, color: Colors.red),
                      title: Text(
                        "Kelas / No. Absen",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      subtitle: Text(
                        "XI PPLG 1 / Absen 02", // Sesuaikan dengan nomor absenmu
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.info_outline, color: Colors.red),
                      title: Text(
                        "Bio Singkat",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          "Siswa jurusan Pengembangan Perangkat Lunak dan Gim (PPLG) yang antusias dalam pengembangan aplikasi mobile Flutter, web, dan game.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}