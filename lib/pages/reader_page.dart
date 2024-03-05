import "package:epub_reader/models/book.dart";
import "package:epub_view/epub_view.dart";
import "package:flutter/material.dart";

class ReaderPage extends StatefulWidget {
  final Book book;
  const ReaderPage({super.key, required this.book});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  late EpubController _epubReaderController;

  @override
  void initState() {
    _epubReaderController =
        EpubController(document: EpubDocument.openAsset(widget.book.epubPath));
    super.initState();
  }

  @override
  void dispose() {
    _epubReaderController.dispose();
    super.dispose();
  }

  // void _showCurrentEpubCfi(context) {
  //   final cfi = _epubReaderController.generateEpubCfi();

  //   if (cfi != null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(cfi),
  //         action: SnackBarAction(
  //           label: 'GO',
  //           onPressed: () {
  //             _epubReaderController.gotoEpubCfi(cfi);
  //           },
  //         ),
  //       ),
  //     );
  //   }
  // }

  // Alert Dialog function
  void _showMenuDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          //content: new Text("Alert Dialog body"),
          actions: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: Text('TextButton'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EpubViewActualChapter(
          controller: _epubReaderController,
          builder: (chapterValue) => Text(
            chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? '',
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save_alt),
            color: Colors.white,
            // onPressed: () => _showCurrentEpubCfi(context),
            onPressed: () => _showMenuDialog(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: EpubViewTableOfContents(controller: _epubReaderController),
      ),
      body: EpubView(
        builders: EpubViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          chapterDividerBuilder: (_) => const Divider(),
        ),
        controller: _epubReaderController,
      ),
    );
  }
}
