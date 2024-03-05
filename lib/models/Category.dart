import 'package:counter_getx/models/Quote.dart';

class Category {
  final int? id;
  final String name;
  final String logo;
  final int is_free;
  final String type;

  Category({
    this.id,
    required this.name,
    required this.logo,
    required this.is_free,
    required this.type,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      is_free: json['is_free'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'is_free': is_free,
      'type': type,
    };
  }
}

class CategoryItem {
  late Category category;
  late List<Quote> quotes;

  CategoryItem({
    required this.category,
    required this.quotes,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      category: Category.fromJson(json),
      quotes: List<Quote>.from(
          json['quotes'].map((quoteJson) => Quote.fromJson(quoteJson))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category.toJson(),
      'quotes': quotes.map((quote) => quote.toJson()).toList(),
    };
  }
}
