// favorited_books_screen.dart
import 'package:book_shopping_f/FavoritedBooksScreen%20.dart';
import 'package:flutter/material.dart';

class Sepet extends StatelessWidget {
  const Sepet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
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
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 202, 225, 247),
            height: 250.0,
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
                    width: 35.0,
                  ),
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
            bottom: 2.0,
            right: 16.0,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
              ),
              child: const Text(
                'Sepeti Onayla',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeartIcon extends StatefulWidget {
  const HeartIcon({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isFavorited = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
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
