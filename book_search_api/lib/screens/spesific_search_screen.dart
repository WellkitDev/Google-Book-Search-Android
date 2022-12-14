import 'package:book_search_api/provider/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecificSearchScreen extends StatefulWidget {
  static const routeName = '/specific-search-screen';

  @override
  State<SpecificSearchScreen> createState() => _SpecificSearchScreenState();
}

class _SpecificSearchScreenState extends State<SpecificSearchScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> searchArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Column(
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
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0, top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('categoryTitle'),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text('bookTitle'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: Provider.of<Books>(context, listen: false)
                .getSearchedBookByArgs(searchArgs),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                Provider.of<Books>(context, listen: false)
                    .toggleTotalItemsCalculation(false);
                //bookgrid
              }
            },
          ),
        ],
      ),
    );
  }
}
