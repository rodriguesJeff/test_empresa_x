import 'package:dartz/dartz.dart';
import 'package:teste_iatec/features/advice/domain/repositories/advice_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/advice.dart';

class GetAdvice {
  final AdviceRepository repository;

  GetAdvice(this.repository);

  Future<Either<Failure, Advice?>?> execute() async {
    return await repository.getAdvice();
  }
}
