import 'package:book_search_api/models/book.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final Book book;
  const TitleWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FittedBox(
            child: Text(
              Utils.trimString(book.title, 50),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          if (book.subtitle != null)
            Text(
              Utils.trimString(book.subtitle, 40),
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            )
        ],
      ),
    );
  }
}
