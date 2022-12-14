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

  Future<void> fetchAndSetBooks() async {
    await DBHelper.database();
    final savedBookList = await DBHelper.getData('bookshelf');
    _saveBooks = savedBookList
        .map(
          (item) => SavedBook(
            id: item['bookId'],
            title: item['bookTitle'],
            authors: item['authors'],
            imageUrl: item['bookImageUrl'],
          ),
        )
        .toList();
  }

  //remove data saved
  Future<void> removeSavedBook(String id) async {
    await DBHelper.deleteBook(id);
    fetchAndSetBooks();
  }

  //chek data find book
  Future<bool> checkExistingBook(String id) async {
    return await DBHelper.findBook(id);
  }
}
