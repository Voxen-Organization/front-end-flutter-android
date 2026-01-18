import 'package:english_app/features/sentences/domain/entities/sentence_entity.dart';
import 'package:flutter/material.dart';

class CustomSentenceWidget extends StatefulWidget {
  final SentenceEntity sentece;

  const CustomSentenceWidget({
    super.key,
    required this.sentece,
  });

  @override
  State<CustomSentenceWidget> createState() =>
      _CustomSentenceWidgetState();
}

class _CustomSentenceWidgetState extends State<CustomSentenceWidget> {
  final Map<String, TextEditingController> _controllers = {};
  final Map<String, bool> _isCorrect = {};

  String _normalize(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp(r"[^\w']"), '');
  }

  List<String> _tokenize(String text) {
  return RegExp(r"[A-Za-z]+|\d+|\'[a-z]+|n't|[.,!?]")
      .allMatches(text)
      .map((m) => m.group(0)!)
      .toList();
}

  @override
  void initState() {
    super.initState();

    for (final word in widget.sentece.wordsKey) {
      _controllers[word] = TextEditingController();
      _isCorrect[word] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = _tokenize(widget.sentece.sentenceText);

    return ListTile(
      title: Wrap(
        spacing: 6,
        runSpacing: 8,
        children: tokens.map<Widget>((token) {
          final normalizedToken = _normalize(token);

          final keyWord = widget.sentece.wordsKey.firstWhere(
            (w) => _normalize(w) == normalizedToken,
            orElse: () => '',
          );

          if (keyWord.isNotEmpty) {
            final controller = _controllers[keyWord]!;

            return SizedBox(
              width: 60,
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  final isCorrect =
                      _normalize(value) == _normalize(keyWord);

                  setState(() {
                    _isCorrect[keyWord] = isCorrect;
                  });
                },
                style: TextStyle(
                  fontSize: 16,
                  color: _isCorrect[keyWord]! ? Colors.green : Colors.black,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: UnderlineInputBorder(),
                ),
              ),
            );
          }

          return Text(
            token,
            style: const TextStyle(fontSize: 16),
          );
        }).toList(),
      ),
    );
  }
}

