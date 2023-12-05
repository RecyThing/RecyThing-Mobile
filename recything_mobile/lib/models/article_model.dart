class ArticleModel {
  String id;
  String title;
  String image;
  String content;
  String category;
  int like;
  int share;
  String createDate;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.category,
    required this.like,
    required this.share,
    required this.createDate,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        content: json["content"],
        category: json["category"],
        like: json["like"],
        share: json["share"],
        createDate: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "content": content,
        "category": category,
        "like": like,
        "share": share,
        "created_at": createDate
      };
}
