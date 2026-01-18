import 'package:english_app/features/home/data/models/sentence_model.dart';
import 'package:english_app/features/home/domain/entities/unit_entity.dart';

class UnitModel extends UnitEntity {
  UnitModel({
    required super.id,
    required super.title,
    required super.description,
    required super.sentences,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      sentences: (json['sentences'] as List<dynamic>)
          .map((sentenceJson) => SentenceModel.fromJson(sentenceJson))
          .toList(),
    );
  }
}
