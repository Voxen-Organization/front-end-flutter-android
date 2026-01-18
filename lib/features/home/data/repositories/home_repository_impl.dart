import 'package:english_app/core/result/failure.dart';
import 'package:english_app/core/result/result.dart';
import 'package:english_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:english_app/features/home/domain/entities/book_entity.dart';
import 'package:english_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository{
  final HomeRemoteDatasource remoteDatasource;
  HomeRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Result<Failure, List<BookEntity>>> getBooks() async{
    
    try {
      
      final books = await remoteDatasource.getBooks();
      return Right(books);
    } on ServerFailure {
      return Left(ServerFailure('Erro ao buscar livros'));
    } catch (e) {
      return Left(ServerFailure('Erro desconhecido: $e'));
    }
  }
}