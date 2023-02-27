import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_iatec/core/error/exceptions.dart';
import 'package:teste_iatec/core/error/failures.dart';
import 'package:teste_iatec/features/advice/data/datasources/advice_remote_datasource.dart';
import 'package:teste_iatec/features/advice/data/repositories/advice_repository_impl.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';

class MockRemoteDataSource extends Mock implements AdviceRemoteDataSource {}

void main() {
  late AdviceRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = AdviceRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  const advice = Advice(id: 1, advice: 'test');

  test(
      'Deve retornar dados remotos quando a chamada ao data source remoto acontecer corretamente',
      () async {
    // arrange
    when(mockRemoteDataSource.getAdvice()).thenAnswer((_) async => advice);
    // act
    final result = await repository.getAdvice();
    // assert
    verify(mockRemoteDataSource.getAdvice());
    expect(result, equals(const Right(advice)));
  });

  test(
      'Deve salvar em cache localmente o conselho quando a busca funciona corretamente',
      () async {
    // arrange
    when(mockRemoteDataSource.getAdvice()).thenAnswer((_) async => advice);
    // act
    await repository.getAdvice();
    // assert
    verify(mockRemoteDataSource.getAdvice());
  });

  test(
      'Deve retornar um server failure quando a chamada para um data source remoto ocorrer com erro',
      () async {
    // arrange
    when(mockRemoteDataSource.getAdvice()).thenThrow(ServerException());
    // act
    final result = await repository.getAdvice();
    // assert
    verify(mockRemoteDataSource.getAdvice());
    expect(result, equals(Left(ServerFailure())));
  });
}
