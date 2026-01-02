class SentenceValidationResult {
  final int id;
  final bool isCorrect;
  final int correctCount;
  final int totalCount;

  const SentenceValidationResult({
    required this.id,
    required this.isCorrect,
    required this.correctCount,
    required this.totalCount,
  });
}