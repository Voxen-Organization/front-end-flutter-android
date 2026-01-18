import 'package:english_app/features/sentences/domain/entities/sentence_entity.dart';

class SentenceModel extends SentenceEntity {
  SentenceModel({
    required super.id,
    required super.sentenceText,
    required super.wordsKey,
    required super.tags,
  });

  factory SentenceModel.fromJson(Map<String, dynamic> json) {
    return SentenceModel(
      id: json['id'],
      sentenceText: json['sentence_text'],
      wordsKey: List<String>.from(json['words_key']),
      tags: List<String>.from(json['tags']),
    );
  }
}
