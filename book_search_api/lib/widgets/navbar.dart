import 'dart:math';

import 'package:book_search_api/provider/books.dart';
import 'package:book_search_api/screens/bookshelf_screen.dart';
import 'package:book_search_api/screens/home_screen.dart';
import 'package:book_search_api/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final String currentRoute;
  const NavBar(this.currentRoute);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool openNav = true;

  @override
  Widget build(BuildContext context) {
    final hight = min(MediaQuery.of(context).size.height * 0.09, 60.0);
    final width = min(
      openNav
          ? MediaQuery.of(context).size.width * 0.6
          : MediaQuery.of(context).size.width * 0.2,
      200.0,
    );
    return Container(
      height: hight,
      width: width,
      child: Row(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            color: Colors.white,
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (openNav)
                  NavbarBotton(Icons.bookmark, BookShelfScreen.routeName,
                      widget.currentRoute),
                if (openNav)
                  NavbarBotton(
                      Icons.home, HomeScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarBotton(Icons.search, SearchScreen.routeName,
                      widget.currentRoute),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarBotton extends StatelessWidget {
  final IconData icon;
  final String route;
  final String currentRoute;
  const NavbarBotton(this.icon, this.route, this.currentRoute);

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context, listen: false);

    return IconButton(
      icon: IconButton(
        onPressed: () {
          if (currentRoute == route) return;
          Navigator.of(context).pushReplacementNamed(route);
          books.setFirstLoad(true);
        },
        icon: Icon(icon),
        color: Color(0xff0DB067),
      ),
    );
  }
}
