import 'package:book_search_api/models/book.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:flutter/material.dart';

class AuthorsWidget extends StatelessWidget {
  final Book book;
  const AuthorsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Utils.ListToString(book.authors, '   '),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.teal,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
