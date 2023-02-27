import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:teste_iatec/core/error/failures.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';
import 'package:teste_iatec/features/advice/domain/usecases/get_advice_usecase.dart';
import 'package:teste_iatec/features/advice/presentation/cubit/advices_cubit.dart';

class MockGetAdvice extends Mock implements GetAdvice {}

void main() {
  late AdvicesCubit cubit;
  late MockGetAdvice usecase;

  setUp(() {
    usecase = MockGetAdvice();
    cubit = AdvicesCubit(usecase: usecase);
  });

  const advice = Advice(id: 5, advice: 'test');

  blocTest<AdvicesCubit, AdvicesState>(
    'Deve emitir um estado carregado com um conselho',
    build: () => AdvicesCubit(usecase: usecase),
    act: (c) {
      when(usecase()).thenAnswer((_) async => const Right(advice));
      c.getAdvice();
    },
    expect: () => [AdvicesLoading(), const AdvicesLoaded(advice: advice)],
  );

  blocTest<AdvicesCubit, AdvicesState>(
    'Deve retornar um estado inicial quando ocorrer algum erro',
    build: () => AdvicesCubit(usecase: usecase),
    act: (c) {
      when(c.getAdvice()).thenAnswer((_) async => const Right(advice));
    },
    expect: () => [AdvicesLoading(), AdvicesInitial()],
  );
}
