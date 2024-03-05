import 'package:counter_getx/models/Category.dart';

class Theme {
  final int? id;
  final String font_en;
  final String font_ar;
  final String image;
  final int is_free;

  Theme({
    this.id,
    required this.font_en,
    required this.font_ar,
    required this.image,
    required this.is_free,
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
      id: json['id'],
      font_en: json['font_en'],
      font_ar: json['font_ar'],
      image: json['image'],
      is_free: json['is_free'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'font_en': font_en,
      'font_ar': font_ar,
      'image': image,
      'is_free': is_free,
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
