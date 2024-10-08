import 'package:flutter/material.dart';

void main() {
  runApp(RekomendasiWisataApp());
}

class RekomendasiWisataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Rekomendasi Wisata'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Baturaden',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.network(
                'https://pesonakota.com/wp-content/uploads/2019/02/tempat-wisata-di-Baturraden.jpg',
                height: 200,
                width: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'Baturaden adalah sebuah objek wisata alam yang terletak di lereng Gunung Slamet, sekitar 15 kilometer dari pusat kota Purwokerto, Kabupaten Banyumas, Jawa Tengah. Terkenal dengan pemandangan alamnya yang indah dan udara yang sejuk, Baturaden menjadi destinasi favorit wisatawan lokal maupun mancanegara.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi ketika tombol ditekan
                  print('Kunjungi Sekarang');
                },
                child: Text('Kunjungi Sekarang'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Ubah primary menjadi backgroundColor
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
