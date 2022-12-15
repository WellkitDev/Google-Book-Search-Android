import 'package:book_search_api/provider/books.dart';
import 'package:book_search_api/provider/bookshelf.dart';
import 'package:book_search_api/widgets/navbar.dart';
import 'package:book_search_api/widgets/saved_book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookShelfScreen extends StatefulWidget {
  static const routeName = '/bookshelf';

  @override
  State<BookShelfScreen> createState() => _BookShelfScreenState();
}

class _BookShelfScreenState extends State<BookShelfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingbutoonlocation
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(BookShelfScreen.routeName),
      //floating botton
      body: RefreshIndicator(
        child: Consumer<Bookshelf>(
          builder: (BuildContext context, bookshelf, Widget child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
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
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16, top: 16.0, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Bookshelf',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<Bookshelf>(context, listen: false)
                        .fetchAndSetBooks(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : bookshelf.savedBooks.length <= 0
                              ? EmptyBookshelfWidget()
                              : ListView.builder(
                                  itemBuilder: (ctx, i) => SavedBookItem(
                                    bookshelf.savedBooks.reversed.toList()[i],
                                  ),
                                );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        onRefresh: () async {
          setState(() {
            return Future.delayed(Duration.zero);
          });
        },
      ),
    );
  }
}

class EmptyBookshelfWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Clik",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            WidgetSpan(
                child: Icon(
              Icons.bookmark_border,
              size: 18,
            )),
            TextSpan(
              text: "to add books to the bookshelf",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
