import 'package:english_app/core/result/failure.dart';
import 'package:english_app/core/result/result.dart';
import 'package:english_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRepository {
  Future<Result<Failure, List<BookEntity>>> getBooks();
}