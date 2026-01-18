import 'package:english_app/features/sentences/domain/entities/sentence_entity.dart';

class UnitEntity {
  final int id;
  final String title;
  final String description;
  final List<SentenceEntity> sentences;

  const UnitEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.sentences,
  });
}