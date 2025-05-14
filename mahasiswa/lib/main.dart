import 'package:flutter/material.dart';
import './view/home.dart';
import './view/crud.dart';
import './view/login.dart'; // Tambahkan import login.dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Mahasiswa',
      initialRoute: '/login', // Arahkan awalnya ke halaman login
      routes: {
        '/login': (context) => LoginPage(), // Halaman login
        '/home': (context) => Home(), // Halaman home
        '/crud': (context) => CRUD(datamhs: null), // Halaman CRUD
      },
    );
  }
}
