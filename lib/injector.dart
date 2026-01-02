import 'package:english_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:english_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:english_app/features/auth/domain/commands/login_command.dart';
import 'package:english_app/features/auth/domain/commands/register_command.dart';
import 'package:english_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:english_app/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:english_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:english_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:english_app/features/home/domain/commands/get_books_command.dart';
import 'package:english_app/features/home/domain/repositories/home_repository.dart';
import 'package:english_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:english_app/features/sentences/domain/commands/validate_sentences_command.dart';
import 'package:english_app/features/sentences/presentation/sentences_view_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setupInjector() {
  // VIEWMODELS
  getIt.registerFactory<AuthViewModel>(
    () => AuthViewModel(
      loginCommand: getIt<LoginCommand>(),
      registerCommand: getIt<RegisterCommand>(),
    ),
  );

  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(getBooksCommand: getIt<GetBooksCommand>()),
  );

  getIt.registerFactory<SentencesViewModel>(
  () => SentencesViewModel(getIt<ValidateSentencesCommand>()),
);

  // COMMANDS
  getIt.registerLazySingleton<LoginCommand>(
    () => LoginCommand(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterCommand>(
    () => RegisterCommand(repository: getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetBooksCommand>(
    () => GetBooksCommand(repository: getIt<HomeRepository>()),
  );

  getIt.registerLazySingleton<ValidateSentencesCommand>(
    () => ValidateSentencesCommand(),
  );

  // REPOSITORIES
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDatasource: getIt<AuthRemoteDatasource>()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDatasource: getIt<HomeRemoteDatasource>()),
  );

  // DATASOURCES
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(
      client: getIt<http.Client>(),
      baseUrl: dotenv.env['BASE_URL']!,
    ),
  );
  getIt.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(
      client: getIt<http.Client>(),
      baseUrl: dotenv.env['BASE_URL']!,
    ),
  );

  // DEPENDÊNCIAS EXTERNAS
  getIt.registerLazySingleton<http.Client>(() => http.Client());
}
