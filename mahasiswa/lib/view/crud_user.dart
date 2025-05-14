import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CRUD_USER extends StatefulWidget {
  final Map? datauser;

  const CRUD_USER({Key? key, required this.datauser}) : super(key: key);

  @override
  CRUDUSERState createState() => CRUDUSERState();
}

class CRUDUSERState extends State<CRUD_USER> {
  String status = "";
  TextEditingController idController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Menambahkan data tabel
  Future tambahuser() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/user/create.php"),
      body: {
        "id": idController.text,
        "username": usernameController.text,
        "password": passwordController.text,
      },
    );
  }

  // Update data tabel
  Future ubahuser() async {
    return await http.post(
      Uri.parse("http://localhost/apitugas/user/update.php"),
      body: {
        "id": widget.datauser!['id'], // ← FIXED
        "username": usernameController.text,
        "password": passwordController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.datauser != null) {
      status = "Ubah Data User";
      idController.text = widget.datauser!['id'];
      usernameController.text = widget.datauser!['username'];
      passwordController.text = widget.datauser!['password'];
    } else {
      status = "Tambah Data User";
      idController.clear();
      usernameController.clear();
      passwordController.clear();
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
                controller: idController,
                decoration: const InputDecoration(labelText: 'ID'),
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (widget.datauser == null) {
                    await tambahuser();
                  } else {
                    await ubahuser();
                  }
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                },
                child: Text(widget.datauser == null ? 'Tambah' : 'Ubah'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
