import 'package:intl/intl.dart';

import 'category_article_model.dart';

class ArticleModel {
  String id;
  String title;
  String image;
  String content;
  List<CategoryModel> categories;
  int like;
  int share;
  String createDate;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.categories,
    required this.like,
    required this.share,
    required String createDate,
  }) : createDate = _formatDate(createDate);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    List<CategoryModel> categoriesList = [];
    if (json["categories"] != null) {
      categoriesList = (json["categories"] as List)
          .map((category) => CategoryModel.fromJson(category))
          .toList();
    }

    return ArticleModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      content: json["content"],
      categories: categoriesList,
      like: json["like"],
      share: json["share"],
      createDate: json["created_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "content": content,
        "categories": categories.map((category) => category.toJson()).toList(),
        "like": like,
        "share": share,
        "created_at": createDate,
      };

  static String _formatDate(String inputDate) {
    // Parse the input date string
    DateTime dateTime = DateTime.parse(inputDate);

    // Format the date using intl package
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);

    return formattedDate;
  }

  String getCategoryString() {
    return CategoryModel.getCategoryStringList(categories);
  }
}
