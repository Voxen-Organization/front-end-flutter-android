import 'dart:convert';

import 'package:english_app/features/home/data/models/book_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDatasource {
  Future<List<BookModel>> getBooks();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final http.Client client;
  final String baseUrl;
  const HomeRemoteDatasourceImpl({required this.baseUrl, required this.client});

  @override
  Future<List<BookModel>> getBooks() async {
    final url = Uri.parse('$baseUrl/books');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        final List<dynamic> jsonList = jsonDecode(response.body);

        final books = jsonList.map((json) {
          return BookModel.fromJson(json);
        }).toList();

        return books;
      } catch (e, stack) {
        rethrow;
      }
    } else {
      throw Exception('Erro ao buscar livros');
    }
  }
}
