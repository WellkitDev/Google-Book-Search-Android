import 'package:book_search_api/models/category.dart';
import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  List<Category> categoriesList = [
    Category(
        categoryTitle: 'Animal',
        categoryLink: 'animal',
        iconLink: 'images/veterinary.png'),
    Category(
        categoryTitle: 'Art &\nLiteratur',
        categoryLink: 'Art and Literatur',
        iconLink: 'images/art.png'),
    Category(
        categoryTitle: 'Biography',
        categoryLink: 'Biography',
        iconLink: 'images/dictionary.png'),
    Category(
        categoryTitle: 'Comedy',
        categoryLink: 'comedy',
        iconLink: 'images/comedy.png'),
    Category(
        categoryTitle: 'Cooking',
        categoryLink: 'cooking',
        iconLink: 'images/recipe-book.png'),
    Category(
        categoryTitle: 'Code',
        categoryLink: 'Code',
        iconLink: 'images/coding.png'),
    Category(
        categoryTitle: 'Drama',
        categoryLink: 'drama',
        iconLink: 'images/drama.png'),
    Category(
        categoryTitle: 'Education',
        categoryLink: 'Education',
        iconLink: 'images/stock.png'),
    Category(
        categoryTitle: 'Fantasy',
        categoryLink: 'fantasy',
        iconLink: 'images/fairy-tale.png'),
    Category(
        categoryTitle: 'Fiction',
        categoryLink: 'fiction',
        iconLink: 'images/sword.png'),
    Category(
        categoryTitle: 'History',
        categoryLink: 'history',
        iconLink: 'images/history.png'),
    Category(
        categoryTitle: 'Religi',
        categoryLink: 'religi',
        iconLink: 'images/quran.png'),
    Category(
        categoryTitle: 'Thriller',
        categoryLink: 'thriller',
        iconLink: 'images/thriller.png'),
  ];
}
