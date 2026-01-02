import 'package:english_app/features/home/domain/entities/unit_entity.dart';
import 'package:english_app/features/sentences/presentation/sentences_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SentencesPage extends StatefulWidget {
  const SentencesPage({super.key});

  @override
  State<SentencesPage> createState() => _SentencesPageState();
}

class _SentencesPageState extends State<SentencesPage> {

  late SentencesViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = GetIt.I<SentencesViewModel>();
  }

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
              child: ListView.builder(
                itemCount: unit.sentences.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(unit.sentences[index].sentenceText),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}