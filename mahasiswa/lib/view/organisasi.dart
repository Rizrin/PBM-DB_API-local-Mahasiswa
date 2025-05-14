import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './crud_organisasi.dart'; // ← Import sesuai
import 'home.dart' as home_view;
import 'hobi.dart';
import 'user.dart';

class Organisasi extends StatefulWidget {
  const Organisasi({Key? key}) : super(key: key);

  @override
  OrganisasiState createState() => OrganisasiState();
}

class OrganisasiState extends State<Organisasi> {
  List _organisasiList = [];

  @override
  void initState() {
    super.initState();
    refreshDataOrganisasi();
  }

  void refreshDataOrganisasi() async {
    final hasil = await http
        .get(Uri.parse("http://localhost/apitugas/organisasi/list.php"));
    if (hasil.statusCode == 200) {
      setState(() {
        _organisasiList = json.decode(hasil.body);
      });
    }
  }

  void hapusDataOrganisasi(String nim) async {
    await http.post(
      Uri.parse("http://localhost/apitugas/organisasi/delete.php"),
      body: {'nim': nim},
    );
    refreshDataOrganisasi();
  }

  void konfirmasiHapus(String nim) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus"),
          content: const Text('Apakah Anda yakin ingin menghapus data ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Icon(Icons.cancel, color: Colors.red),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                hapusDataOrganisasi(nim);
              },
              child: const Icon(Icons.check_circle, color: Colors.green),
            ),
          ],
        );
      },
    );
  }

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const home_view.Home()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Hobi()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Organisasi()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const User()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Data Organisasi',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1F1F1F),
        elevation: 4,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _organisasiList.length,
        itemBuilder: (context, index) {
          var item = _organisasiList[index];
          return Card(
            color: const Color(0xFF1E1E1E),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(item['nama'],
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
              subtitle: Text(
                '${item['nama organisasi']} • ${item['tahun gabung'].substring(0, 10)}',
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.amber),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CRUD_ORGANISASI(dataorganisasi: item)),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => konfirmasiHapus(item['nim']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CRUD_ORGANISASI(dataorganisasi: null)));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1F1F1F),
        selectedItemColor: Colors.cyanAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports), label: 'Hobi'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Organisasi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
      ),
    );
  }
}
