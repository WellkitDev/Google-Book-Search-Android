import 'package:book_search_api/provider/books.dart';
import 'package:book_search_api/screens/detail_book_screen.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class BookOverviewItems extends StatelessWidget {
  final String bookId;
  const BookOverviewItems(this.bookId);

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Books>(context, listen: false).getBookById(bookId);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BookDetailBottonSheet(book);
          },
          elevation: 18.0,
          isScrollControlled: true,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: book.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          if (book.title != null)
            Expanded(
              flex: 2,
              child: Text(
                Utils.trimString(book.title, 22),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                maxLines: 2,
              ),
            ),
        ],
      ),
    );
  }
}
