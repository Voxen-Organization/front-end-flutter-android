import 'package:english_app/features/home/domain/entities/unit_entity.dart';
import 'package:english_app/features/sentences/presentation/widgets/custom_sentence_widget.dart';
import 'package:flutter/material.dart';

class SentencesPage extends StatefulWidget {
  const SentencesPage({super.key});

  @override
  State<SentencesPage> createState() => _SentencesPageState();
}

class _SentencesPageState extends State<SentencesPage> {


  @override
  Widget build(BuildContext context) {

    final unit = ModalRoute.of(context)?.settings.arguments as UnitEntity;

    return Scaffold(
      appBar: AppBar(title: Text('Unit ${unit.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Sentences", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              ),
            Expanded(
              child: ListView.separated(
                itemCount: unit.sentences.length,
                itemBuilder: (context, index) {
                  return CustomSentenceWidget(sentece: unit.sentences[index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}