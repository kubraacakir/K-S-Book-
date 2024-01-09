// ignore: file_names
import 'dart:convert';

import 'package:book_shopping_f/FavoritedBooksScreen%20.dart';
import 'package:book_shopping_f/Search.dart';
import 'package:book_shopping_f/Sepet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<StatefulWidget> createState() => _AnasayfaState();
}

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(Object context) {
    final List<String> imageUrls = [
      'assets/images/polisiye.jpg',
      'assets/images/ask.jpg',
      'assets/images/cocuk.jpg',
      'assets/images/fantastik.jpg',
      'assets/images/felsefe.jpg',
      'assets/images/kurgu.jpg',
      'assets/images/macera.jpg',
      'assets/images/psikoloji.jpg',
      'assets/images/tarih.jpg'
    ];
    return Container(
      color: const Color.fromARGB(255, 202, 225, 247),
      height: 747.0,
      alignment: Alignment.bottomCenter,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 50.0,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 110.0,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Her fotoğraf tıklandığında yapılacak işlemler buraya gelecek
              // Örneğin, yeni bir ekran açılabilir
              _onImageTap(context, index);
            },
            child: Stack(
              children: [
                Image.asset(
                  imageUrls[index],
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _getCaptionForIndex(index),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getCaptionForIndex(int index) {
    // Her fotoğraf için farklı yazıları burada belirleyebilirsiniz
    switch (index) {
      case 0:
        return 'Polisiye';
      case 1:
        return 'Aşk';
      case 2:
        return 'Çocuk';
      case 3:
        return 'Fantastik';
      case 4:
        return 'Felsefe';
      case 5:
        return 'Kurgu';
      case 6:
        return 'Macera';
      case 7:
        return 'Psikoloji';
      case 8:
        return 'Tarih';
      default:
        return '';
    }
  }

  void _onImageTap(BuildContext context, int index) {
    // Her fotoğraf tıklandığında yapılacak işlemleri buraya ekleyebilirsiniz
    // Örneğin, yeni bir ekran açabilirsiniz
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PolisiyeSayfasi()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AskSayfasi()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CocukSayfasi()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FantastikSayfasi()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FelsefeSayfasi()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KurguSayfasi()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MaceraSayfasi()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PsikolojiSayfasi()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TarihSayfasi()),
        );
        break;
      // Diğer kategoriler için benzer şekilde ekleyebilirsiniz
      default:
        break;
    }
  }
}

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Kalp ikonunun durumunu tersine çevir
          isFavorited = !isFavorited;
        });
      },
      child: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: isFavorited ? Colors.red : null,
        size: 48.0,
      ),
    );
  }
}

class PolisiyeSayfasi extends StatelessWidget {
  const PolisiyeSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Polisiye Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 520.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 115.0, vertical: 0.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Cinayet Alfabesi',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 35.0),
                  Image(
                    image: AssetImage('assets/images/polisiye.jpg'),
                    fit: BoxFit.fill,
                    width: 70.00,
                    height: 90.00,
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 32.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : Agatha Christie',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :120',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2022',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 55 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180.0,
            left: 280.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
          Positioned(
            top: 230.0, // Uygun bir konum belirleyin
            child: Container(
              width: MediaQuery.of(context).size.width -
                  0, // Ekran genişliği kadar uzunluk
              margin:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Colors.black),
                ),
              ),
            ),
          ),
          // Yeni kitap ekleniyor
          Positioned(
            top: 250.0, // Uygun bir konum belirleyin
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120.0, vertical: 60.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Ölüm Büyüsü',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width:
                          35.0), // Metin ile fotoğraf arasına boşluk ekleyebilirsiniz
                ],
              ),
            ),
          ),
          const Positioned(
            top: 290.0,
            left: 310.0,
            child: Image(
              image: AssetImage(
                  'assets/images/polisiye2.jpg'), // Yeni kitabın fotoğraf path'i
              fit: BoxFit.fill,
              width: 70.00,
              height: 90.00,
            ),
          ),
          const Positioned(
            top: 300.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 345.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : Agatha Christie',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :100',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2021',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 75 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 450.0,
            left: 280.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AskSayfasi extends StatelessWidget {
  const AskSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aşk Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 115.0, vertical: 0.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Çalıkuşu',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 90.0,
                  ), // Metin ile fotoğraf arasına boşluk ekleyebilirsiniz
                  Image(
                    image: AssetImage(
                        'assets/images/ask.jpg'), // Fotoğrafın path'ini belirtin
                    fit: BoxFit.fill,
                    width: 70.00,
                    height: 90.00, // Fotoğrafın boyutunu ayarlayın
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 32.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : Reşat Nuri Güntekin',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :230',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2013',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 165 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 190.0,
            left: 280.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CocukSayfasi extends StatelessWidget {
  const CocukSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Çocuk Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 115.0, vertical: 0.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Küçük Prens',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width:
                          75.0), // Metin ile fotoğraf arasına boşluk ekleyebilirsiniz
                  Image(
                    image: AssetImage(
                        'assets/images/cocuk.jpg'), // Fotoğrafın path'ini belirtin
                    fit: BoxFit.fill,
                    width: 85.00,
                    height: 100.00, // Fotoğrafın boyutunu ayarlayın
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 34.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : Antoine de Saint-Exupéry',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :80',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2014',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 85 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 185.0,
            left: 280.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FantastikSayfasi extends StatelessWidget {
  const FantastikSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fantastik Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 115.0, vertical: 0.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Harry Potter',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width:
                          55.0), // Metin ile fotoğraf arasına boşluk ekleyebilirsiniz
                  Image(
                    image: AssetImage(
                        'assets/images/fantastik.jpg'), // Fotoğrafın path'ini belirtin
                    fit: BoxFit.fill,
                    width: 70.00,
                    height: 90.00, // Fotoğrafın boyutunu ayarlayın
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 32.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : J. K. Rowling',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :220',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2023',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 255 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 185.0,
            left: 280.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FelsefeSayfasi extends StatelessWidget {
  const FelsefeSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Felsefe Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 88.0, vertical: 10.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Sokratesin Savunması',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width:
                          25.0), // Metin ile fotoğraf arasına boşluk ekleyebilirsiniz
                  Image(
                    image: AssetImage(
                        'assets/images/felsefe.jpg'), // Fotoğrafın path'ini belirtin
                    fit: BoxFit.fill,
                    width: 70.00,
                    height: 90.00, // Fotoğrafın boyutunu ayarlayın
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 40.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : Platon',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı : 64',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2017',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 55 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 185.0,
            left: 280.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KurguSayfasi extends StatelessWidget {
  const KurguSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurgu Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 85.0, vertical: 32.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Bilinmeyen Bir Kadının Mektubu',
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 80.0,
            left: 300.0,
            child: Image(
              image: AssetImage(
                  'assets/images/kurgu.jpg'), // Fotoğrafın path'ini belirtin
              fit: BoxFit.fill,
              width: 95.00,
              height: 105.00, // Fotoğrafın boyutunu ayarlayın
            ),
          ),
          const Positioned(
            top: 32.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 30.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : Stefan Zweig',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :90',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2021',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 70 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200.0,
            left: 290.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MaceraSayfasi extends StatelessWidget {
  const MaceraSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Macera Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 115.0, vertical: 35.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Define Adası',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 20.0,
            left: 300.0,
            child: Image(
              image: AssetImage(
                  'assets/images/macera.jpg'), // Fotoğrafın path'ini belirtin
              fit: BoxFit.fill,
              width: 80.00,
              height: 100.00, // Fotoğrafın boyutunu ayarlayın
            ),
          ),
          const Positioned(
            top: 32.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : R. Louis Stevenson',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :100',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2010',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 65 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 185.0,
            left: 280.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PsikolojiSayfasi extends StatelessWidget {
  const PsikolojiSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psikoloji Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 80.0, vertical: 35.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Bir Psikiyatristin Gizli Defteri',
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 90.0,
            left: 300.0,
            child: Image(
              image: AssetImage(
                  'assets/images/psikoloji.jpg'), // Fotoğrafın path'ini belirtin
              fit: BoxFit.fill,
              width: 80.00,
              height: 100.00, // Fotoğrafın boyutunu ayarlayın
            ),
          ),
          const Positioned(
            top: 32.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : Gary Small, Gigi Vorgan',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :120',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2019',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 150 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200.0,
            left: 285.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TarihSayfasi extends StatelessWidget {
  const TarihSayfasi({super.key});
  void _navigateFunction(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Sepet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarih Kategorisi'),
      ),
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 260.0,
            alignment: Alignment.center,
            child: const SingleChildScrollView(
              child: Column(),
            ),
          ),
          Positioned(
            top: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 85.0, vertical: 35.0),
              color: const Color.fromARGB(255, 202, 225, 247),
              child: const Row(
                children: [
                  Text(
                    'Gazi Mustafa Kemal Atatürk',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 80.0,
            left: 300.0,
            child: Image(
              image: AssetImage(
                  'assets/images/tarih.jpg'), // Fotoğrafın path'ini belirtin
              fit: BoxFit.fill,
              width: 90.00,
              height: 110.00, // Fotoğrafın boyutunu ayarlayın
            ),
          ),
          const Positioned(
            top: 32.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0),
                Text(
                  'Yazar : İlber Ortaylı',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Sayfa Sayısı :200',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Basım Yılı : 2024',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Fiyat : 200 TL',
                  style:
                      TextStyle(fontSize: 18.00, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            top: 195.0,
            left: 290.0,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateFunction(context),
                  child: const Text('Sepete Ekle'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnasayfaState extends State {
  String dropdownvalue = ' SEÇİNİZ';

  // List of items in our dropdown menu
  var items = [
    " SEÇİNİZ",
    'Polisiye',
    'Tarih',
    'Aşk',
    'Kurgu',
    'Macera',
    "Çocuk",
    "Psikoloji",
    "Felsefe",
    "Fantastik",
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TextEditingController categoryController = TextEditingController();
    // ignore: unused_element, no_leading_underscores_for_local_identifiers
    dynamic _getCategory() async {
      final url = Uri.parse('http://10.0.2.2:1112/category/getAll');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      // ignore: avoid_print
      // print('Response: ${response.body}');
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
          msg: "Oldu.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 18.0,
        );
        // Liste içindeki elemanları JSON formatına çevirme
        String jsonResponse = jsonEncode(response.body);
        final dynamic decodedData = jsonDecode(jsonResponse);
        // ignore: void_checks
        return decodedData;
      } else {
        Fluttertoast.showToast(
          msg: "Olmadı.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18.0,
        );
      }
    }

    // ignore: unused_local_variable
    final List<String> imageUrls = [
      'assets/images/polisiye.jpg',
      'assets/images/ask.jpg',
      'assets/images/cocuk.jpg',
      'assets/images/fantastik.jpg',
      'assets/images/felsefe.jpg',
      'assets/images/kurgu.jpg',
      'assets/images/macera.jpg',
      'assets/images/psikoloji.jpg',
      'assets/images/tarih.jpg'
    ];

    return MaterialApp(
        title: 'ANASAYFA',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                Container(
                  width: 151.0,
                  color: const Color.fromARGB(255, 46, 56, 119),
                  child: DropdownButton(
                    key: const Key("KATEGORİLER"),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 10, 10),
                    ),
                    // Initial Value
                    value: dropdownvalue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    // After selecting the desired option, it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        // Kategoriye göre sayfaya yönlendirme yap
                        _navigateToCategoryPage(newValue);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Container(
                  width: 80.0,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logom.png'),
                          fit: BoxFit.fill),
                      shape: BoxShape.rectangle),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Container(
                  width: 80.0,
                  color: const Color.fromARGB(255, 46, 56, 119),
                  child: IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () async {
                        dynamic result = await _getCategory();
                        // ignore: unnecessary_type_check
                        if (result is dynamic) {
                          List<Widget> categoryWidgets = [];
                          for (var category in result) {
                            // ignore: avoid_print
                            print(category);
                            categoryWidgets.add(
                              Container(
                                width: 90,
                                height: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(category['imagePath']),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            );
                          }
                        }
                      }),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Search(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FavoritedBooksScreen(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Sepet(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: const ImageGrid()));
  }

  void _navigateToCategoryPage(String category) {
    // Kategoriye göre sayfaya yönlendirme yap
    switch (category) {
      case 'Polisiye':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PolisiyeSayfasi()),
        );
        break;
      case 'Tarih':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TarihSayfasi()),
        );
        break;
      case 'Aşk':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AskSayfasi()),
        );
        break;
      case 'Kurgu':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const KurguSayfasi()),
        );
        break;
      case 'Macera':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MaceraSayfasi()),
        );
        break;
      case 'Çocuk':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CocukSayfasi()),
        );
        break;
      case 'Psikoloji':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PsikolojiSayfasi()),
        );
        break;
      case 'Felsefe':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FelsefeSayfasi()),
        );
        break;
      case 'Fantastik':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FantastikSayfasi()),
        );
        break;
      // Diğer kategoriler için benzer şekilde ekleyebilirsiniz
      default:
        break;
    }
  }
}
