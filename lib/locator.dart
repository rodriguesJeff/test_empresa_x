import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:teste_iatec/features/advice/data/datasources/advice_remote_datasource.dart';
import 'package:teste_iatec/features/advice/data/datasources/advice_remote_datasource_impl.dart';
import 'package:teste_iatec/features/advice/data/repositories/advice_repository_impl.dart';
import 'package:teste_iatec/features/advice/domain/repositories/advice_repository.dart';
import 'package:teste_iatec/features/advice/domain/usecases/get_advice_usecase.dart';
import 'package:teste_iatec/features/advice/presentation/cubit/advices_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AdviceRepository>(
    () => AdviceRepositoryImpl(remoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<AdviceRemoteDataSource>(
      () => AdviceRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton(() => http.Client());

  getIt.registerLazySingleton(() => GetAdvice(getIt()));
  getIt.registerFactory(() => AdvicesCubit(usecase: getIt()));
}
