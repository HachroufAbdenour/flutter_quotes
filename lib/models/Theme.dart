import 'package:counter_getx/models/Category.dart';

class Theme {
  final int? id;
  final String font_en;
  final String image;
  final int isFree;

  Theme({
    this.id,
    required this.font_en,
    required this.image,
    required this.isFree,
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
      id: json['id'],
      font_en: json['font_en'],
      image: json['image'],
      isFree: json['is_free'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'font_en': font_en,
      'image': image,
      'is_free': isFree,
    };
  }
}

class ThemeItem {
  late Theme theme;
  late Category category;

  ThemeItem({
    required this.theme,
    required this.category,
  });

  factory ThemeItem.fromJson(Map<String, dynamic> json) {
    return ThemeItem(
      theme: Theme.fromJson(json),
      category: Category.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme.toJson(),
      'category': category.toJson(),
    };
  }
}
