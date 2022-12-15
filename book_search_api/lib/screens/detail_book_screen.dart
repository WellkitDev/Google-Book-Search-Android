import 'package:book_search_api/models/book.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:book_search_api/widgets/detailsWidget/book_details.dart';
import 'package:book_search_api/widgets/detailsWidget/bookmark_widget.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BookDetailBottonSheet extends StatelessWidget {
  final Book book;
  const BookDetailBottonSheet(this.book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Color(0xFF737373).withOpacity(0),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: (100 / 2) + 20, left: 16.0, right: 16.0),
                child: BookDetailsWidget(book),
              ),
            ),
            Positioned(
              top: -100 / 2,
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Container(
                  height: 150,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      book.thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 25,
              top: 20,
              child: IconButton(
                onPressed: () {
                  Share.share(
                      'Check out this Book: \n ${book.title}\n ${book.infoLink}');
                },
                icon: Icon(Icons.share),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Bookmark(book.id, book),
            ),
            Positioned(
              top: 70,
              right: 20,
              child: Container(
                height: 36,
                width: 36,
                child: GestureDetector(
                  onTap: () {
                    Utils.launchURL(
                        'https://www.amazon.com/s?k=${book.title} ${Utils.ListToString(book.authors, ' ')}&language=en_US&currency=INR');
                  },
                  child: Image.asset('images/amazonicon.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
