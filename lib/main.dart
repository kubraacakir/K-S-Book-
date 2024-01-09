import 'package:book_shopping_f/uyeGiris.dart';
import 'package:book_shopping_f/uyeOl.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      routes: {
        "/uyeOl": (context) => const UyeOl(),
        "/uyeGiris": (context) => const UyeGiris(),
      },
      title: 'Welcome to Flutter',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HOŞGELDİNİZ'),
        ),
        body: Container(
          color: const Color.fromARGB(255, 202, 225, 247),
          height: 750.0,
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 300.0,
                width: 300.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logom.png'),
                        fit: BoxFit.fill),
                    shape: BoxShape.circle),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                  height: 50.0,
                  width: 400.0,
                  color: Colors.lightBlue,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, "/uyeOl");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UyeOl(),
                        ),
                      );
                    },
                    child: const Text(
                      "Üye Kayıt",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 50.0,
                  width: 400.0,
                  color: const Color.fromARGB(255, 243, 65, 124),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const UyeGiris(),
                        ),
                      );
                    },
                    child: const Text(
                      "Üye Giriş",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
