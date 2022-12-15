import 'package:book_search_api/provider/books.dart';
import 'package:book_search_api/widgets/book_grid.dart';
import 'package:book_search_api/widgets/navbar.dart';
import 'package:book_search_api/widgets/network_sensitive.dart';
import 'package:book_search_api/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool loadGrid = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration.zero).then((_) async {
      Provider.of<Books>(context, listen: false).clearList();

      setState(() {
        loadGrid = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(SearchScreen.routeName),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/book-title.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: Colors.black38,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 32.0, bottom: 2.0, left: 16.0, right: 16.0),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discover',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                'Search from more than 30 million books with over 10 million free ebooks..',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 12.0,
                                    letterSpacing: 0.2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              NetworkSensitive(
                child: SearchBar(),
                offlineChild: Container(),
              ),
            ],
          ),
          if (loadGrid) BooksGrid(SearchScreen.routeName),
        ],
      ),
    );
  }
}
