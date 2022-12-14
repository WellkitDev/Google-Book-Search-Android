import 'package:book_search_api/provider/books.dart';
import 'package:book_search_api/widgets/network_sensitive.dart';
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
          child: Consumer<Books>(),
        ),
      ),
    );
  }
}
