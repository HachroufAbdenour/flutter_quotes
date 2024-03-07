import 'package:counter_getx/models/Category.dart';

class Theme {
  final int? id;
  final String font;
  final String image;
  final int isFree;

  Theme({
    this.id,
    required this.font,
    required this.image,
    required this.isFree,
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    
    return Theme(
      id: json['id'],
      font: json['font'],
      image: json['image'],
      isFree: json['is_free'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'font': font,
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
