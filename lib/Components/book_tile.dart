import "package:epub_reader/models/book.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class BookTile extends StatelessWidget {
  final Book book;
  final void Function()? onTap;

  const BookTile({super.key, required this.book, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(left: 5, right: 5),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  book.imagePath,
                  height: 50,
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        book.name,
                        style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(book.detail),
                    ],
                  )
                ],
              ),
            ),
            const Column(
              children: [
                Icon(
                  Icons.bookmark_add,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
