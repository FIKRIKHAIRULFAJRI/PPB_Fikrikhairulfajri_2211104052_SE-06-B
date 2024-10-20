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

class WisataHomePage extends StatefulWidget {
  @override
  _WisataHomePageState createState() => _WisataHomePageState();
}

class _WisataHomePageState extends State<WisataHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TransaksiPage(),
    NotifikasiPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Wisata> daftarWisata = [
    Wisata(
      nama: 'Baturaden',
      deskripsi:
          'Baturaden terletak di lereng Gunung Slamet dengan udara sejuk dan pemandangan menawan.',
      imageUrl:
          'https://www.mgriyahotel.com/wp-content/uploads/2018/07/tamanbunga-slide.jpg',
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Banyumas Trip Adventure',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            background: Image.network(
              'https://www.mgriyahotel.com/wp-content/uploads/2018/07/DSC0661_small.jpg',
              fit: BoxFit.cover,
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final wisata = daftarWisata[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
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
                ),
              );
            },
            childCount: daftarWisata.length,
          ),
        ),
      ],
    );
  }
}

class TransaksiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Halaman Transaksi',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class NotifikasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Halaman Notifikasi',
        style: TextStyle(fontSize: 24),
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
