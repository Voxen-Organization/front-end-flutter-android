import 'dart:developer';

import 'package:english_app/core/command/no_params.dart';
import 'package:english_app/core/result/result.dart';
import 'package:english_app/features/home/domain/commands/get_books_command.dart';
import 'package:english_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final GetBooksCommand getBooksCommand;
  HomeViewModel({required this.getBooksCommand});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<BookEntity> _books = [];
  List<BookEntity> get books => _books;

  Future<void> loadBooks() async {
    
    _isLoading = true;
    _errorMessage = null;
    
    notifyListeners();

    final result = await getBooksCommand.execute(NoParams());

    result.fold(
      (failure) {
        
        _errorMessage = failure.message;
        _isLoading = false;
      },
      (books) {
        
        _books = books;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
