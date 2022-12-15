import 'package:book_search_api/provider/categories.dart';
import 'package:book_search_api/widgets/selectionWidget/categories_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriesSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);

    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 8.0, left: 22.0),
            child: Text(
              'Categories',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.70,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categories.categoriesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, i) =>
                  CategoryItem(categories.categoriesList[i]),
            ),
          ),
        ],
      ),
    );
  }
}
