class SentenceEntity {
  final int id;
  final String sentenceText;
  final List<String> wordsKey;
  final List<String> tags;

  const SentenceEntity({
    required this.id,
    required this.sentenceText,
    required this.wordsKey,
    required this.tags,
  });
}
