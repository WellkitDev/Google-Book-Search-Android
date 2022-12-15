import 'package:book_search_api/provider/books.dart';
import 'package:book_search_api/provider/bookshelf.dart';
import 'package:book_search_api/provider/categories.dart';
import 'package:book_search_api/provider/gtc.dart';
import 'package:book_search_api/screens/bookshelf_screen.dart';
import 'package:book_search_api/screens/home_screen.dart';
import 'package:book_search_api/screens/search_screen.dart';
import 'package:book_search_api/screens/spesific_search_screen.dart';
import 'package:book_search_api/services/connectivity_service.dart';
import 'package:book_search_api/services/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Books(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => GTC(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Bookshelf(),
        ),
        StreamProvider<ConnectivityStatus>(
          create: (BuildContext context) =>
              ConnectivityService().connectionStatusController.stream,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Books Search Whit API ',
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
          BookShelfScreen.routeName: (context) => BookShelfScreen(),
          SpecificSearchScreen.routeName: (context) => SpecificSearchScreen(),
        },
      ),
    );
  }
}
