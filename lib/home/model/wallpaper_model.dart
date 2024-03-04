class WallpaperModel {
  String categoryName;
  String wallPaperImage;
  List<String> wallPaperTags;
  int dateCreated;

  WallpaperModel({
    required this.categoryName,
    required this.wallPaperImage,
    required this.wallPaperTags,
    required this.dateCreated,
  });

  factory WallpaperModel.fromJson(Map<String, dynamic> json) => WallpaperModel(
        categoryName: json["category_name"],
        wallPaperImage: json["wall_paper_image"],
        wallPaperTags: List<String>.from(json["wall_paper_tags"].map((x) => x)),
        dateCreated: json["date_created"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "wall_paper_image": wallPaperImage,
        "wall_paper_tags": List<dynamic>.from(wallPaperTags.map((x) => x)),
        "date_created": dateCreated,
      };
}
