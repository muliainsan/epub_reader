// ignore_for_file: public_member_api_docs, sort_constructors_first
class Book {
  String name;
  String detail;
  String imagePath;
  String epubPath;

  Book({
    required this.name,
    required this.detail,
    required this.imagePath,
    required this.epubPath,
  });

  String get getName => name;

  set setName(String name) => this.name = name;

  get getDetail => detail;

  set setDetail(detail) => this.detail = detail;

  get getImagePath => imagePath;

  set setImagePath(imagePath) => this.imagePath = imagePath;

  get getEpubPath => epubPath;

  set setEpubPath(epubPath) => this.epubPath = epubPath;
}
