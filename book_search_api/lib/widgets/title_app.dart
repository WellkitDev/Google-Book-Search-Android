import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/book-title.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black38,
          child: Padding(
            padding: EdgeInsets.all(22.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Material(
                  elevation: 18,
                  color: Colors.transparent,
                  child: Container(
                    child: Text(
                      'Book\nSearch',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          height: 0.9,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
