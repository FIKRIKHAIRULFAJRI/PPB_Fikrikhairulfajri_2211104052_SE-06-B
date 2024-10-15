import 'package:flutter/material.dart';

void main() {
  runApp(RekomendasiWisataApp());
}

class RekomendasiWisataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata Banyumas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WisataHomePage(),
    );
  }
}

class WisataHomePage extends StatelessWidget {
  final List<Wisata> daftarWisata = [
    Wisata(
      nama: 'Baturaden',
      deskripsi:
          'Baturaden terletak di lereng Gunung Slamet dengan udara sejuk dan pemandangan menawan.',
      imageUrl:
          'https://akcdn.detik.net.id/community/media/visual/2023/09/05/lokawisata-baturraden-1.jpeg',
    ),
    Wisata(
      nama: 'Curug Cipendok',
      deskripsi:
          'Air terjun indah dengan ketinggian 92 meter, dikelilingi oleh hutan pinus.',
      imageUrl:
          'https://travelspromo.com/wp-content/uploads/2019/11/11-Curug-Cipendok-Serba-Tutorial-e1573635278868.jpg',
    ),
    Wisata(
      nama: 'Telaga Sunyi',
      deskripsi:
          'Telaga dengan air jernih dan suasana damai, cocok untuk relaksasi dan ketenangan.',
      imageUrl:
          'https://cdns.klimg.com/merdeka.com/i/w/news/2018/03/28/956725/content_images/670x335/20180328040704-1-telaga-sunyi-002-tantri-setyorini.jpg',
    ),
    Wisata(
      nama: 'Museum BRI',
      deskripsi:
          'Museum yang menceritakan sejarah berdirinya Bank Rakyat Indonesia di Purwokerto.',
      imageUrl:
          'https://purwokertokita.com/wp-content/uploads/2017/08/museum-BRI-purwokerto-384x220.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Banyumas Trip Adventure',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true, // Ini memusatkan judul di tengah
      ),
      body: ListView.builder(
        itemCount: daftarWisata.length,
        itemBuilder: (context, index) {
          final wisata = daftarWisata[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.0)),
                        child: Image.network(
                          wisata.imageUrl,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              wisata.nama,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              wisata.deskripsi,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailWisataPage(wisata: wisata),
                                      ),
                                    );
                                  },
                                  child: Text('Detail'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: Colors.green,
                                    size: 32,
                                  ),
                                  onPressed: () {
                                    print('Tambah ke rencana perjalanan');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Tambah Rencana');
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DetailWisataPage extends StatelessWidget {
  final Wisata wisata;

  DetailWisataPage({required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              wisata.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              wisata.nama,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              wisata.deskripsi,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Wisata {
  final String nama;
  final String deskripsi;
  final String imageUrl;

  Wisata({
    required this.nama,
    required this.deskripsi,
    required this.imageUrl,
  });
}
