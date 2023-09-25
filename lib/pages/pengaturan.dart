import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({Key? key}) : super(key: key);

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  TextEditingController passwordInput = TextEditingController();
  TextEditingController confirmPasswordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Flexible(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pengaturan',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Password Saat Ini :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordInput,
                    decoration: const InputDecoration(
                      labelText: 'Masukkan Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                      ),
                      focusColor: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Password Baru :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordInput,
                    decoration: const InputDecoration(
                      labelText: 'Masukkan Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.green,
                      ),
                      focusColor: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Simpan'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
