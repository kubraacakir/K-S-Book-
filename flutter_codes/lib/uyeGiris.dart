// ignore: file_names, unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:book_shopping_f/anasayfa.dart';

class UyeGiris extends StatefulWidget {
  const UyeGiris({super.key});

  @override
  State<StatefulWidget> createState() => _UyeOlState();
}

class _UyeOlState extends State {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController sifreController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    void _getVerileriGonder() async {
      String email = emailController.text;
      String password = sifreController.text;
      final url = Uri.parse(
          'http://10.0.2.2:1112/api/users/get?email=$email&password=$password');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Giriş Başarılı.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 18.0,
        );
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Anasayfa(),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Email veya şifre hatalı.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0,
        );
      }
    }

    return MaterialApp(
      title: 'ÜYE GİRİŞ',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ÜYE GİRİŞ'),
        ),
        body: Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 750.0,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: 250.0,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logom.png'),
                            fit: BoxFit.fill),
                        shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextField(
                    controller: sifreController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Şifre',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _getVerileriGonder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 63, 189, 67),
                    ),
                    child: const Text('Giriş Yap'),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
