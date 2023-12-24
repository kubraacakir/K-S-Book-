// ignore: file_names
import 'dart:convert';

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
  @override
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
                    'Cinayet Alfabesi',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                      width:
                          35.0), // Metin ile fotoğraf arasına boşluk ekleyebilirsiniz
                  Image(
                    image: AssetImage(
                        'assets/images/polisiye.jpg'), // Fotoğrafın path'ini belirtin
                    fit: BoxFit.fill,
                    width: 70.00,
                    height: 90.00, // Fotoğrafın boyutunu ayarlayın
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: HeartIcon(),
          ),
          const Positioned(
            top: 55.0,
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
          const Positioned(
            top: 75.0,
            left: 20.0,
            child: Row(
              children: [
                // ElevatedButton(onPressed: _onPre, child: const Text('Sepete Ekle'), style: ButtonStyle(backgroundColor: Color.fromARGB(255, 63, 189, 67)),)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AskSayfasi extends StatelessWidget {
  const AskSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aşk Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Aşk kategorisine aittir.'),
      ),
    );
  }
}

class CocukSayfasi extends StatelessWidget {
  const CocukSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Çocuk Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Çocuk kategorisine aittir.'),
      ),
    );
  }
}

class FantastikSayfasi extends StatelessWidget {
  const FantastikSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fantastik Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Fantastik kategorisine aittir.'),
      ),
    );
  }
}

class FelsefeSayfasi extends StatelessWidget {
  const FelsefeSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Felsefe Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Felsefe kategorisine aittir.'),
      ),
    );
  }
}

class KurguSayfasi extends StatelessWidget {
  const KurguSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurgu Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Kurgu kategorisine aittir.'),
      ),
    );
  }
}

class MaceraSayfasi extends StatelessWidget {
  const MaceraSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Macera Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Macera kategorisine aittir.'),
      ),
    );
  }
}

class PsikolojiSayfasi extends StatelessWidget {
  const PsikolojiSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psikoloji Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Psikoloji kategorisine aittir.'),
      ),
    );
  }
}

class TarihSayfasi extends StatelessWidget {
  const TarihSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarih Kategorisi'),
      ),
      body: const Center(
        child: Text('Bu sayfa Tarih kategorisine aittir.'),
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
                        // _getCategory metodunu çağır ve sonucu bekleyerek al
                        dynamic result = await _getCategory();
                        // result, bir liste içinde kategorileri içeriyor varsayalım
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
                      // "Ara" butonuna tıklandığında yapılacak işlemler
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      // "Ayarlar" butonuna tıklandığında yapılacak işlemler
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      // "Ayarlar" butonuna tıklandığında yapılacak işlemler
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
