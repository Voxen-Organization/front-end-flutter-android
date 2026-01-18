import 'package:english_app/core/command/command.dart';
import 'package:english_app/core/command/no_params.dart';
import 'package:english_app/core/result/failure.dart';
import 'package:english_app/core/result/result.dart';
import 'package:english_app/features/home/domain/entities/book_entity.dart';
import 'package:english_app/features/home/domain/repositories/home_repository.dart';

class GetBooksCommand implements Command<List<BookEntity>, NoParams> {
  final HomeRepository repository;
  GetBooksCommand({required this.repository});

  @override
  Future<Result<Failure, List<BookEntity>>> execute(NoParams params) async {
    
    return await repository.getBooks();
  }
}
