class QuotesClass {
  String? text;
  String? author;

  QuotesClass({this.text, this.author});

  static List<String> quotesList = [];

  void removeFaveriote(String quote) {
    quotesList.remove(quote);
  }
}
