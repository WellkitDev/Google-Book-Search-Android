import 'package:book_search_api/models/book.dart';
import 'package:book_search_api/widgets/detailsWidget/action_widget.dart';
import 'package:book_search_api/widgets/detailsWidget/authors_widget.dart';
import 'package:book_search_api/widgets/detailsWidget/categories_widget.dart';
import 'package:book_search_api/widgets/detailsWidget/description_widget.dart';
import 'package:book_search_api/widgets/detailsWidget/metadata_widget.dart';
import 'package:book_search_api/widgets/detailsWidget/title_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsWidget extends StatelessWidget {
  final Book book;
  const BookDetailsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesWidget(
          book,
        ),
        SizedBox(
          height: 10.0,
        ),
        AuthorsWidget(
          book,
        ),
        SizedBox(
          height: 10.0,
        ),
        TitleWidget(
          book,
        ),
        Divider(),
        DescriptionWidget(
          book,
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(),
        SizedBox(
          height: 10.0,
        ),
        MetadatWidget(
          book,
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(),
        ActionWidget(
          book,
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
