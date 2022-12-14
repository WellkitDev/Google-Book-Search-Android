import 'package:book_search_api/models/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatefulWidget {
  final Category category;
  const CategoryItem(this.category);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  double elevation = 18.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        bottom: MediaQuery.of(context).size.height * 0.09 * 1.3,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          elevation: elevation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    widget.category.iconLink,
                    scale: 1.0,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    widget.category.categoryTitle,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
