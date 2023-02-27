import 'package:teste_iatec/core/error/exceptions.dart';
import 'package:teste_iatec/features/advice/data/datasources/advice_local_datasource.dart';
import 'package:teste_iatec/features/advice/data/datasources/advice_remote_datasource.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';
import 'package:teste_iatec/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:teste_iatec/features/advice/domain/repositories/advice_repository.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDataSource remoteDataSource;
  final AdviceLocalDataSource localDataSource;

  AdviceRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Advice?>>? getAdvice() async {
    try {
      final remoteAdvice = await remoteDataSource.getAdvice();
      if (remoteAdvice != null) localDataSource.cacheAdvice(remoteAdvice);
      return Right(remoteAdvice);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
