import 'package:epub_reader/Components/book_tile.dart';
import 'package:epub_reader/models/book.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:epub_reader/Components/button.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  final List<Book> BookList = [
    Book(
      name: "Al-Fatihah",
      detail: "Surah 1",
      imagePath: "lib/assets/images/sushi_chopstick.png",
      epubPath: "lib/assets/epubs/tbate4.epub",
    ),
    Book(
      name: "Al-Ikhlas",
      detail: "Surah 2",
      imagePath: "lib/assets/images/sushi_egg.png",
      epubPath: "lib/assets/epubs/tbate4.epub",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Yadhal Fatha",
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: BookList.length,
        itemBuilder: (context, index) => BookTile(
          book: BookList[index],
          onTap: () => navigateTo,
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
