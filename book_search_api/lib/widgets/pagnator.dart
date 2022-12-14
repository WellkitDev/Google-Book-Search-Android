import 'package:book_search_api/provider/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagenator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Books>(
      builder: (BuildContext context, books, _) {
        return Card(
          elevation: 4.0,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${books.totalBookCount} books found',
                  style: TextStyle(
                      color: Color(0xff0DB067), fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_left),
                  color: Color(0xff0DB067),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right),
                  color: Color(0xff0DB067),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
