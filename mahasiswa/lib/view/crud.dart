import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/mahasiswa.dart';

class CRUD extends StatefulWidget {
  final Map? datamhs;

  CRUD({Key? key, required this.datamhs})
      : super(key: key); // Jika null safety aktif

  @override
  CRUDState createState() => CRUDState();
}

class CRUDState extends State<CRUD> {
  String status = "";
  TextEditingController nimController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController prodiController = TextEditingController();
  TextEditingController fakultasController = TextEditingController();

  // Menambahkan data tabel
  Future tambahmhs() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/mahasiswa/create.php"),
      body: {
        "nim": nimController.text,
        "nama": namaController.text,
        "prodi": prodiController.text,
        "fakultas": fakultasController.text,
      },
    );
  }

  // Update data tabel
  Future ubahmhs() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/mahasiswa/update.php"),
      body: {
        "nim": widget.datamhs!['nim'],
        "nama": namaController.text,
        "prodi": prodiController.text,
        "fakultas": fakultasController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.datamhs != null) {
      status = "Ubah Data Mahasiswa";
      nimController.text = widget.datamhs!['nim'];
      namaController.text = widget.datamhs!['nama'];
      prodiController.text = widget.datamhs!['prodi'];
      fakultasController.text = widget.datamhs!['fakultas'];
    } else {
      status = "Tambah Data Mahasiswa";
      nimController.text = "";
      namaController.text = "";
      prodiController.text = "";
      fakultasController.text = "";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(status),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: nimController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'nim'),
                ),
                TextFormField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: prodiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Prodi'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: fakultasController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'fakultas'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (widget.datamhs == null) {
                      await tambahmhs();
                    } else {
                      await ubahmhs();
                    }
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  },
                  child: Text(widget.datamhs == null ? 'Tambah' : 'Ubah'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
