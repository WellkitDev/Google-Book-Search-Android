import 'package:book_search_api/models/book.dart';
import 'package:book_search_api/services/utils.dart';
import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final Book book;
  const ActionWidget(this.book);

  @override
  Widget build(BuildContext context) {
    String availability;
    IconData icon;

    if (book.accessViewStatus == 'SAMPLE') {
      availability = 'SAMPLE';
      icon = Icons.description;
    } else if (book.accessViewStatus == 'FULL_PUBLIC_DOMAIN') {
      availability = 'READ';
      icon = Icons.book;
    } else {
      availability = 'PAID';
      icon = Icons.attach_money;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionBottom(
          icon: Icons.chrome_reader_mode,
          label: 'PREVIEW',
          onPrassed: () async {
            await Utils.launchURL(book.preViewLink);
          },
        ),
        SizedBox(
          width: 5.0,
        ),
        ActionBottom(
          icon: Icons.shop,
          label: book.seleability != 'FOR_SALE'
              ? 'N/A'
              : '${book.amount} ${book.currencyCode}',
          onPrassed: book.seleability != 'FOR_SALE'
              ? null
              : () async {
                  await Utils.launchURL(book.buyLink);
                },
        ),
        SizedBox(
          width: 5.0,
        ),
        ActionBottom(
          icon: icon,
          label: availability,
          onPrassed: book.accessViewStatus != 'FULL_PUBLIC_DOMAIN' &&
                  book.accessViewStatus != 'SAMPLE'
              ? null
              : () async {
                  await Utils.launchURL(book.webReaderLink);
                },
        ),
      ],
    );
  }
}

class ActionBottom extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPrassed;

  const ActionBottom({
    @required this.icon,
    @required this.label,
    @required this.onPrassed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text(
        label,
        style: TextStyle(fontSize: 10.0),
      ),
      onPressed: onPrassed,
      icon: Icon(
        icon,
        size: 16.0,
      ),
    );
  }
}
