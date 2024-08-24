import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  final String? kota_asal;
  final String? kota_tujuan;
  final String? berat;
  final String? kurir;

  const DetailPage(
      {super.key, this.kota_asal, this.kota_tujuan, this.berat, this.kurir});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List listData = [];
  var strKey = "89d4833bc61f6b6fe0b4e5b482b6d81e"; // Ganti dengan API key Anda yang valid

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final response = await http.post(
        Uri.parse(
          "https://api.rajaongkir.com/starter/cost",
        ),
        headers: {
          "key": strKey, // Menambahkan key di header juga
        },
        body: {
          "origin": widget.kota_asal ?? "",
          "destination": widget.kota_tujuan ?? "",
          "weight": widget.berat ?? "",
          "courier": widget.kurir ?? ""
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          listData = data['rajaongkir']['results'][0]['costs'];
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Detail Ongkos Kirim ${widget.kurir.toString().toUpperCase()}"),
      ),
      body: listData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: listData.length,
              itemBuilder: (_, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child: ListTile(
                    title: Text("${listData[index]['service']}"),
                    subtitle: Text("${listData[index]['description']}"),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Rp ${listData[index]['cost'][0]['value']}",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.red),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text("${listData[index]['cost'][0]['etd']} Days")
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
