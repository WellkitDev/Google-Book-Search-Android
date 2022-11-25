class Book {
  final String id;
  final int rank;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final List<String> authors;
  final String singleAuthor;
  final String preViewLink;
  final String infoLink;
  final String isbn;
  final String buyLink;
  final String description;
  final List<String> categories;
  final String publisher;
  final String publishedData;
  final String averageRating;
  final String webReaderLink;
  final int pageCount;
  final bool isEbook;
  final String seleability;
  final String amount;
  final String currencyCode;
  final String accessViewStatus;

  Book({
    this.id,
    this.rank,
    this.title,
    this.subtitle,
    this.thumbnailUrl,
    this.authors,
    this.singleAuthor,
    this.preViewLink,
    this.infoLink,
    this.isbn,
    this.buyLink,
    this.description,
    this.categories,
    this.publisher,
    this.publishedData,
    this.averageRating,
    this.webReaderLink,
    this.pageCount,
    this.isEbook,
    this.seleability,
    this.amount,
    this.currencyCode,
    this.accessViewStatus,
  });
}
