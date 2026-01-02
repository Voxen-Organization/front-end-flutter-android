import 'package:english_app/core/command/command.dart';
import 'package:english_app/core/result/failure.dart';
import 'package:english_app/core/result/result.dart';
import 'package:english_app/features/sentences/domain/entities/sentence_entity.dart';
import 'package:english_app/features/sentences/value_objects/sentence_validation_result.dart';

class ValidateSentencesParams {
  final List<SentenceEntity> sentences;
  final Map<int, List<String>> userAnswers;

  ValidateSentencesParams({required this.sentences, required this.userAnswers});
}

class ValidateSentencesCommand
    implements
        Command<List<SentenceValidationResult>, ValidateSentencesParams> {
  @override
  Future<Result<Failure, List<SentenceValidationResult>>> execute(
    ValidateSentencesParams params,
  ) async {
    final results = <SentenceValidationResult>[];

    for (final sentence in params.sentences) {
      final userWords = params.userAnswers[sentence.id] ?? [];

      int correct = 0;

      for (int i = 0; i < sentence.wordsKey.length; i++) {
        if (i < userWords.length &&
            userWords[i].trim().toLowerCase() ==
                sentence.wordsKey[i].trim().toLowerCase()) {
          correct++;
        }
      }

      results.add(
        SentenceValidationResult(
          id: sentence.id,
          isCorrect: correct == sentence.wordsKey.length,
          correctCount: correct,
          totalCount: sentence.wordsKey.length,
        ),
      );
    }

    return Right<Failure, List<SentenceValidationResult>>(results);
  }
}
