import 'package:english_app/features/home/domain/entities/book_entity.dart';
import 'package:english_app/features/home/domain/entities/unit_entity.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class BookDetailsPage extends StatelessWidget {
  
  const BookDetailsPage({super.key});

  void _navigateToUnit(BuildContext context, UnitEntity unit) {
    Routefly.pushNavigate('/sentences', arguments: unit);
  }

  @override
  Widget build(BuildContext context) {

    final book = ModalRoute.of(context)?.settings.arguments as BookEntity;


    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Units", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              ),
            Expanded(
              child: ListView.builder(
                itemCount: book.units.length,
                itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _navigateToUnit(context, book.units[index]),
                  child: ListTile(
                    title: Text('Unit ${book.units[index].id}'),
                    subtitle: Text(book.units[index].title),
                  
                  ),
                );
              }),
            )
          ],
        ),
      )
    );
  }
}
