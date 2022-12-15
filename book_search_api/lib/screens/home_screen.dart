import 'package:book_search_api/provider/gtc.dart';
import 'package:book_search_api/widgets/navbar.dart';
import 'package:book_search_api/widgets/title_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getBooksData();
  }

  Future<void> getBooksData() async {
    await Provider.of<GTC>(context, listen: false).getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(HomeScreen.routeName),
      body: RefreshIndicator(
        color: Color(0xff0DB067),
        backgroundColor: Colors.white,
        displacement: 80,
        child: Column(
          children: [
            TitleApp(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //categoriselection
                      child: Column(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onRefresh: () async {
          await getBooksData();
        },
      ),
    );
  }
}
