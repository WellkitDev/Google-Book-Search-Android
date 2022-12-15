import 'package:book_search_api/provider/books.dart';
import 'package:book_search_api/screens/search_screen.dart';
import 'package:book_search_api/widgets/book_overview.dart';
import 'package:book_search_api/widgets/network_sensitive.dart';
import 'package:book_search_api/widgets/pagnator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksGrid extends StatelessWidget {
  final String routeName;
  const BooksGrid({this.routeName});

  @override
  Widget build(BuildContext context) {
    bool loading;

    return Expanded(
      child: NetworkSensitive(
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Consumer<Books>(
            builder: (BuildContext context, books, _) {
              if (routeName != SearchScreen.routeName) {
                loading = books.specificScreenLoadingState;
              } else
                loading = books.isLoading;
              return Column(
                children: [
                  if (!books.firstLoad)
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
                      child: Pagenator(),
                    ),
                  loading
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : books.reachedEnd
                          ? Expanded(
                              child: Center(
                                child: Text(
                                  'Nothing here.',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 16.0),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 4.0,
                                    crossAxisSpacing: 2.0,
                                    childAspectRatio: 2 / 3,
                                  ),
                                  itemBuilder: (context, i) {
                                    return BookOverviewItems(
                                        books.getBooksList[i].id);
                                  },
                                ),
                              ),
                            ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
