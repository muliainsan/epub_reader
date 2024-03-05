import 'package:epub_reader/Components/book_tile.dart';
import 'package:epub_reader/models/book.dart';
import 'package:epub_reader/pages/reader_page.dart';
import 'package:epub_reader/pages/reader_page_vocsy.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:epub_reader/Components/button.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

@override
class _MenuPageState extends State<MenuPage> {
  void navigateToBookReader(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReaderPage(
                  book: BookList[index],
                )));
  }

  void navigateToVocsyBookReader(int index) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const VocsyReaderPage()));
  }

  // TODO: implement createState
  // ignore: non_constant_identifier_names
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
          onTap: () => navigateToVocsyBookReader(index),
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
