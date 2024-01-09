// ignore_for_file: file_names
import 'package:book_shopping_f/FavoritedBooksScreen%20.dart';
import 'package:book_shopping_f/Sepet.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allBooks = [
    'Cinayet Alfabesi',
    'Ölüm Büyüsü',
    'Çalıkuşu',
    'Küçük Prens',
    'Harry Potter',
    'Sokratesin Savunması',
    'Bilinmeyen Bir Kadının Mektubu',
    'Define Adası',
    'Bir Psikiyatristin Gizli Defteri',
    'Gazi Mustafa Kemal Atatürk'
  ];
  List<String> _filteredBooks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitap Ara'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Kitap Adı Girin',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _filteredBooks = _allBooks
                      .where((book) =>
                          book.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredBooks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredBooks[index]),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
