import 'package:english_app/core/result/result.dart';
import 'package:english_app/features/sentences/domain/commands/validate_sentences_command.dart';
import 'package:english_app/features/sentences/domain/entities/sentence_entity.dart';

import 'package:english_app/features/sentences/value_objects/sentence_validation_result.dart';
import 'package:flutter/material.dart';

class SentencesViewModel extends ChangeNotifier {
  final ValidateSentencesCommand _validateCommand;

  SentencesViewModel(this._validateCommand,);

  final Map<int, List<String>> _userAnswers = {};
  List<SentenceValidationResult> _results = [];

  bool _validated = false;

  // 🔹 getters para a View
  bool get isValidated => _validated;
  List<SentenceValidationResult> get results => _results;

  bool canValidate(List<SentenceEntity> sentences) {
  if (_userAnswers.length < sentences.length) return false;

  return _userAnswers.values.every(
    (answers) => answers.every((a) => a.trim().isNotEmpty),
  );
}


  void updateAnswer(int sentenceId, int index, String value) {
    _userAnswers.putIfAbsent(sentenceId, () => []);
    
    if (_userAnswers[sentenceId]!.length <= index) {
      _userAnswers[sentenceId]!.length = index + 1;
    }

    _userAnswers[sentenceId]![index] = value;
    notifyListeners();
  }

  Future<void> validate(List<SentenceEntity> sentences) async {
    if (!canValidate(sentences)) return;

    final result = await _validateCommand.execute(
      ValidateSentencesParams(
        sentences: sentences,
        userAnswers: _userAnswers,
      ),
    );

    result.fold(
      (failure) {
        // tratar erro
      },
      (success) {
        _results = success;
        _validated = true;
        notifyListeners();
      },
    );
  }
}
