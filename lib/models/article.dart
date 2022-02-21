//--Danh sach bai viet--//
class Articles {
  String title;
  String? author;
  String urlToImage;
  String description;
  DateTime publishedAt;
  String? content;
  String articleUrl;

  //--Contructor--//
  Articles(
      {required this.title,
      this.author,
      required this.urlToImage,
      required this.description,
      required this.publishedAt,
      this.content,
      required this.articleUrl});
}
