import 'package:book_search_api/provider/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool byTitle = true;
  String searchString;
  bool free = false;

  void search() async {
    Provider.of<Books>(context, listen: false).setStartIndex();
    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(true);
    await Provider.of<Books>(context, listen: false)
        .getSearchedBookData(searchString, byTitle, free);
    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        height: 56,
        child: Padding(
          padding: EdgeInsets.only(
            left: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        free = !free;
                        search();
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          free ? 'FREE' : 'ALL',
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 56,
                    child: VerticalDivider(
                      width: 0,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      setState(() {
                        byTitle = !byTitle;
                        search();
                      });
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          byTitle ? 'TITLE' : 'AUTHOR',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 56,
                child: VerticalDivider(
                  width: 0,
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: TextField(
                    autofocus: true,
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 2.0,
                              vertical: 4.0,
                            ),
                            hintText: 'Search Books',
                            hintStyle: TextStyle(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none)
                        .copyWith(
                            hintText: byTitle
                                ? 'Search by title'
                                : 'Search by author'),
                    textInputAction: TextInputAction.search,
                    onChanged: (value) {
                      searchString = value;
                    },
                    onSubmitted: (value) async {
                      if (value == '') {
                        return;
                        search();
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (searchString == null) {
                        return;
                      }
                      if (searchString != null &&
                          searchString.trim().length == 0) {
                        SearchBar();
                      }
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
