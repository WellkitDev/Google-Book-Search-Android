import 'package:book_search_api/models/book.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:flutter/material.dart';

class MetadatWidget extends StatelessWidget {
  final Book book;
  const MetadatWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Publisher',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              Text(
                Utils.trimString(book.publisher, 20),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pages',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              Text(
                book.pageCount == null ? '---' : book.pageCount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rating',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              Text(
                book.averageRating,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Published',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              Text(
                book.publishedData,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
