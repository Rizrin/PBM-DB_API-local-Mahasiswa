import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CRUD_ORGANISASI extends StatefulWidget {
  final Map? dataorganisasi;

  const CRUD_ORGANISASI({Key? key, required this.dataorganisasi})
      : super(key: key);

  @override
  CRUDORGANISASIState createState() => CRUDORGANISASIState();
}

class CRUDORGANISASIState extends State<CRUD_ORGANISASI> {
  String status = "";
  TextEditingController nimController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController nama_organisasiController = TextEditingController();
  TextEditingController thn_bergabungController = TextEditingController();

  // Menambahkan data tabel
  Future tambahorganisasi() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/organisasi/create.php"),
      body: {
        "nim": nimController.text,
        "nama": namaController.text,
        "nama organisasi": nama_organisasiController.text,
        "tahun bergabung": thn_bergabungController.text,
      },
    );
  }

  // Update data tabel
  Future ubahorganiasi() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/organisasi/update.php"),
      body: {
        "nim": widget.dataorganisasi!['nim'],
        "nama": namaController.text,
        "nama organisasi": nama_organisasiController.text,
        "tahun bergabung": thn_bergabungController.text,
      },
    );
  }

  // Format tanggal ke yyyy-MM-dd
  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataorganisasi != null) {
      status = "Ubah Data Organisasi";
      nimController.text = widget.dataorganisasi!['nim'];
      namaController.text = widget.dataorganisasi!['nama'];
      nama_organisasiController.text =
          widget.dataorganisasi!['nama organisasi'];
      thn_bergabungController.text = widget.dataorganisasi!['tahun gabung'];
    } else {
      status = "Tambah Data Organisasi";
      nimController.clear();
      namaController.clear();
      nama_organisasiController.clear();
      thn_bergabungController.clear();
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
                controller: nama_organisasiController,
                decoration: const InputDecoration(labelText: 'Nama Organisasi'),
              ),
              TextFormField(
                controller: thn_bergabungController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Tahun Bergabung',
                  hintText: 'Pilih tanggal',
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      thn_bergabungController.text = formatDate(pickedDate);
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (widget.dataorganisasi == null) {
                    await tambahorganisasi();
                  } else {
                    await ubahorganiasi();
                  }
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                child: Text(widget.dataorganisasi == null ? 'Tambah' : 'Ubah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
