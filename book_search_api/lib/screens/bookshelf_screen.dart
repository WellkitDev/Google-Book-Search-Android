import 'package:book_search_api/provider/bookshelf.dart';
import 'package:flutter/material.dart';
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
      //floating botton
      body: RefreshIndicator(
        child: Consumer<Bookshelf>(
          builder: (BuildContext context, bookshelf, Widget child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(),
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
