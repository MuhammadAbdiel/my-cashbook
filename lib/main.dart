//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'package:sqlitedatabases/pages/login.dart';

//package letak folder Anda
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //judul
      title: 'Tambahkan Daftar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
