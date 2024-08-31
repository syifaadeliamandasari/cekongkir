import 'package:flutter/material.dart';
import 'package:kurirongkir/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tampilanawal(),
    );
  }
}

class Tampilanawal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Center( // Center the Column vertically and horizontally
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'MITRA EKSPEDISI',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 233, 13, 13),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Cari ongkos kirimmu disini',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 200,
                          height: 200,
                          color: Colors.grey[300],
                          child: Image.asset('assets/gambar1.png', width: 100, height: 100),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Draggable bottom section
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 13, 13),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Container(
                      height: 4,
                      width: 40,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Text(
                      'Paketin yu adalah aplikasi yang membantu user atau pengguna untuk melakukan pengecekan dan pemesanan ongkos kirim secara cepat dan mudah. Paketin yu menyediakan berbagai macam layanan pengiriman yang dapat digunakan oleh pengguna untuk mencari dan membandingkan ongkos kirim yang tepat untuk kebutuhan pengiriman.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(showOnboarding: true)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Red button color
                      ),
                      child: Text('Sung Cek'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
