// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sqlitedatabases/database/dbhelper.dart';
import 'package:sqlitedatabases/pages/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future login() async {
    var db = DBHelper();
    var res = await db.getLogin(
      usernameInput.text,
      passwordInput.text,
    );

    if (res != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } else {
      _scaffoldKey.currentState!.showSnackBar(
        const SnackBar(
          content: Text('Username atau Password salah!'),
        ),
      );
    }
  }

  void _setLogin() {
    if (formKey.currentState!.validate()) {
      login();
    }
  }

  @override
  void dispose() {
    usernameInput.dispose();
    passwordInput.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Flexible(
            child: Form(
              key: formKey,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Image(
                        image: AssetImage('assets/icons/logo.png'),
                        width: 200,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'My Cashbook',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Form Input
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username wajib diisi!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.green,
                          ),
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusColor: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password wajib diisi!';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.green,
                          ),
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.green,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          focusColor: Colors.green,
                        ),
                        // obscureText: true,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: _setLogin,
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
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
        ),
      ),
    );
  }
}
