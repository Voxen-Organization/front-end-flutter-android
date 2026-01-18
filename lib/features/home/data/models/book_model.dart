import 'package:english_app/features/home/data/models/unit_model.dart';
import 'package:english_app/features/home/domain/entities/book_entity.dart';

class BookModel extends BookEntity {
  BookModel({
    required super.id,
    required super.title,
    required super.description,
    required super.grammarLevel,
    required super.isPremium,
    required super.units,

  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      grammarLevel: json['grammar_level'],
      isPremium: json['is_premium'],
      units: (json['units'] as List<dynamic>)
          .map((unitJson) => UnitModel.fromJson(unitJson))
          .toList(),
    );
  }
}
