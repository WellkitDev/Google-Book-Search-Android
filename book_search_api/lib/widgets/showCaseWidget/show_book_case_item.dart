import 'package:book_search_api/models/book.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class ShowcaseBookItem extends StatelessWidget {
  final Book book;
  const ShowcaseBookItem(this.book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 0.0,
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                elevation: 4.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
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
              height: 10.0,
            ),
            Text(
              Utils.trimString(
                book.singleAuthor,
                15,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Expanded(
              child: Text(
                Utils.trimString(book.title, 15),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
