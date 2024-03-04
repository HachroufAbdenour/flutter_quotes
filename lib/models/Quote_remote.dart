class QuoteRemote {
  final int? id;
  final String desc_ar;
  final String desc_en;
  final String source_ar;
  final String source_en;
  final int category_id;

  QuoteRemote({
    this.id,
    required this.desc_ar,
    required this.desc_en,
    required this.source_ar,
    required this.source_en,
    required this.category_id,
  });

  factory QuoteRemote.fromJson(Map<String, dynamic> json) {
    return QuoteRemote(
      id: json['id'],
      desc_ar: json['desc_ar'],
      desc_en: json['desc_en'],
      source_ar: json['source_ar'],
      source_en: json['source_en'],
      category_id: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'desc_ar': desc_ar,
      'desc_en': desc_en,
      'source_ar': source_ar,
      'source_en': source_en,
      'category_id': category_id,
    };
  }
}
