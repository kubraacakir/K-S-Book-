// ignore: file_names
import 'dart:convert';

import 'package:book_shopping_f/uyeGiris.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class UyeOl extends StatefulWidget {
  const UyeOl({super.key});

  @override
  State<StatefulWidget> createState() => _UyeOlState();
}

class _UyeOlState extends State {
  @override
  Widget build(BuildContext context) {
    TextEditingController adController = TextEditingController();
    TextEditingController soyadController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController sifreController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    void _postVerileriGonder() async {
      final url = Uri.parse('http://10.0.2.2:1112/api/users/save');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'name': adController.text,
            'surname': soyadController.text,
            'email': emailController.text,
            'password': sifreController.text,
          }));
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Kayıt oluşturuldu.",
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
            builder: (context) => const UyeGiris(),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Bir hata oluştu.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0,
        );
      }
      // if (response.statusCode == 200) {
      //   print('İstek başarılı!'); // Başarılı bir yanıt aldınız.
      //   print('Yanıt: ${response.body}');
      // } else {
      //   print('İstek başarısız!'); // Yanıtta bir hata oldu.
      //   print('Hata kodu: ${response.statusCode}');
      // }
    }

    return MaterialApp(
        title: 'ÜYE OL',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ÜYE KAYIT'),
          ),
          body: Container(
              color: const Color.fromARGB(255, 202, 225, 247),
              height: 747.0,
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
                      height: 40,
                    ),
                    TextField(
                      controller: adController,
                      decoration: const InputDecoration(labelText: 'Ad'),
                    ),
                    TextField(
                      controller: soyadController,
                      decoration: const InputDecoration(labelText: 'Soyad'),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: sifreController,
                      obscureText: true, // Şifre gizlensin mi?
                      decoration: const InputDecoration(labelText: 'Şifre'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _postVerileriGonder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 63, 189, 67),
                      ),
                      child: const Text('Kayıt Ol'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              )),
        ));
  }
}
