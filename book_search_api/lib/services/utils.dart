import 'package:book_search_api/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String ListToString(List<String> list, String operator) {
    String generatedString = '';
    if (list == null) {
      return '----';
    } else {
      list.forEach(
        (element) {
          generatedString += element + operator;
        },
      );
      return generatedString;
    }
  }

  static Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launchURL(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String trimString(String strToTrim, [int trimLimit = 40]) {
    if (strToTrim.length > trimLimit) {
      return '${strToTrim.substring(0, trimLimit)}...';
    }
    return strToTrim;
  }

  static Book bookFromJson(Map book) {
    var volumeInfo = book['volumeInfo'];
    var saleInfo = book['saleInfo'];
    var accessInfo = book['accessInfo'];
    return Book(
      id: book['id'],
      title: volumeInfo['title'],
      subtitle: volumeInfo['subtitle'],
      publishedData: volumeInfo['publishedDate'] != null
          ? (volumeInfo['publishedDate'] as List<dynamic>)
              .map((publis) => publis.toString())
              .toList()
          : volumeInfo['publishedDate'],
      authors: volumeInfo['authors'] != null
          ? (volumeInfo['authors'] as List<dynamic>)
              .map((author) => author.toString())
              .toList()
          : [''],
      publisher: volumeInfo['publisher'] ?? '---',
      description: volumeInfo['description'] ?? 'No description available',
      pageCount: volumeInfo['pageCount'],
      categories: volumeInfo['categories'] == null
          ? []
          : (volumeInfo['categories'] as List<dynamic>)
              .map((category) => category.toString())
              .toList(),
      averageRating: volumeInfo['averageRating'] == null
          ? '---'
          : volumeInfo['averageRating'].toString(),
      thumbnailUrl: volumeInfo['imageLinks'] != null
          ? '${volumeInfo['imageLinks']['thumbnail']}'
          : 'https://www.wildhareboca.com/wp-content/uploads/sites/310/2018/03/image-not-available.jpg',
      preViewLink: volumeInfo['previewLink'],
      infoLink: volumeInfo['infoLink'],
      buyLink: saleInfo['buyLink'],
      webReaderLink: accessInfo['webReaderLink'],
      isEbook: saleInfo['isEbook'],
      seleability: saleInfo['saleability'],
      amount: saleInfo['saleability'] != 'FOR_SALE'
          ? '---'
          : saleInfo['retailPrice']['currencyCode'],
      accessViewStatus: accessInfo['accessViewStatus'],
    );
  }
}
