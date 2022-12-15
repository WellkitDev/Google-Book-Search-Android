import 'package:book_search_api/models/savedBooks.dart';
import 'package:book_search_api/provider/bookshelf.dart';
import 'package:book_search_api/screens/detail_book_screen.dart';
import 'package:book_search_api/services/book_searched.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:book_search_api/widgets/network_sensitive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SavedBookItem extends StatefulWidget {
  final SavedBook savedBook;

  SavedBookItem(this.savedBook);
  @override
  State<SavedBookItem> createState() => _SavedBookItemState();
}

class _SavedBookItemState extends State<SavedBookItem> {
  var searchedBook;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Future.delayed(Duration.zero).then((_) async {
      searchedBook = await BookSearchUtils.fetchBookById(widget.savedBook.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
          elevation: 18.0,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return FutureBuilder(
              future: BookSearchUtils.fetchBookById(widget.savedBook.id),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? LinearProgressIndicator()
                    : BookDetailBottonSheet(searchedBook);
              },
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: Dismissible(
          key: ValueKey(widget.savedBook.id),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.grey[100],
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await Provider.of<Bookshelf>(context, listen: false)
                .removeSavedBook(widget.savedBook.id);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.grey[200],
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.height * 0.11,
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: Card(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                        child: NetworkSensitive(
                          offlineChild: Center(
                            child: Text(
                              'NO INTERNET ACCESS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.savedBook.authors,
                            style: TextStyle(color: Colors.teal, fontSize: 10),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            Utils.trimString(widget.savedBook.title, 50),
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
