import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';
import 'package:teste_iatec/features/advice/domain/repositories/advice_repository.dart';
import 'package:teste_iatec/features/advice/domain/usecases/get_advice_usecase.dart';

class MockAdviceRepository extends Mock implements AdviceRepository {}

void main() {
  late MockAdviceRepository repository;
  late GetAdvice usecase;

  setUp(() {
    repository = MockAdviceRepository();
    usecase = GetAdvice(repository);
  });

  const advice = Advice(id: 1, advice: 'Tenha um bom dia');

  test('Deve retornar um conselho a partir do repositorio', () async {
    when(repository.getAdvice()).thenAnswer((_) async => const Right(advice));

    final result = await usecase();

    expect(result, const Right(advice));
    verify(repository.getAdvice());
    verifyNoMoreInteractions(repository);
  });
}
