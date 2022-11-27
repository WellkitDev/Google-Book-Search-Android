import 'package:book_search_api/models/savedBooks.dart';
import 'package:book_search_api/services/helper_db.dart';
import 'package:flutter/material.dart';

class Bookshelf with ChangeNotifier {
  List<SavedBook> _saveBooks = [];

  List<SavedBook> get savedBooks {
    return [..._saveBooks];
  }

  void addToBookShelf(
      String bookId, String bookTitle, String bookImageUrl, String authors) {
    final bookToSave = SavedBook(
        id: bookId, title: bookTitle, authors: authors, imageUrl: bookImageUrl);
    _saveBooks.add(bookToSave);
    notifyListeners();

    DBHelper.insert('bookshelf', {
      'bookId': bookToSave.id,
      'bookTitle': bookToSave.title,
      'authors': bookToSave.authors,
      'bookImageUrl': bookToSave.imageUrl,
    });
  }
}
