import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/hobi.dart';

class CRUD_HOBI extends StatefulWidget {
  final Map? datahobi;

  const CRUD_HOBI({Key? key, required this.datahobi}) : super(key: key);

  @override
  CRUDHOBIState createState() => CRUDHOBIState(); // ← Nama class yang bener
}

class CRUDHOBIState extends State<CRUD_HOBI> {
  String status = "";
  TextEditingController nimController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController kategoriController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  // Menambahkan data tabel
  Future tambahhobi() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/hobi/create.php"),
      body: {
        "nim": nimController.text,
        "nama": namaController.text,
        "kategori": kategoriController.text,
        "deskripsi": deskripsiController.text, // ← FIXED
      },
    );
  }

  // Update data tabel
  Future ubahhobi() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/hobi/update.php"),
      body: {
        "nim": widget.datahobi!['nim'], // ← FIXED
        "nama": namaController.text,
        "kategori": kategoriController.text,
        "deskripsi": deskripsiController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.datahobi != null) {
      status = "Ubah Data Hobi";
      nimController.text = widget.datahobi!['nim'];
      namaController.text = widget.datahobi!['nama'];
      kategoriController.text = widget.datahobi!['kategori'];
      deskripsiController.text = widget.datahobi!['deskripsi'];
    } else {
      status = "Tambah Data Hobi";
      nimController.clear();
      namaController.clear();
      kategoriController.clear();
      deskripsiController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(status),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nimController,
                decoration: const InputDecoration(labelText: 'NIM'),
              ),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: kategoriController,
                decoration: const InputDecoration(labelText: 'Kategori'),
              ),
              TextFormField(
                controller: deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (widget.datahobi == null) {
                    await tambahhobi();
                  } else {
                    await ubahhobi();
                  }
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                child: Text(widget.datahobi == null ? 'Tambah' : 'Ubah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
