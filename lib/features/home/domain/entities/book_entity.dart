import 'package:english_app/features/home/domain/entities/unit_entity.dart';

class BookEntity {
  final int id;
  final String title;
  final String description;
  final String grammarLevel;
  final bool isPremium;
  final List<UnitEntity> units;

  const BookEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.grammarLevel,
    required this.isPremium,
    required this.units,
  });
}
