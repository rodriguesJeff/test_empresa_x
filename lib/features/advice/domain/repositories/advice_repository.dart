import 'package:dartz/dartz.dart';
import 'package:teste_iatec/core/error/failures.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';

abstract class AdviceRepository {
  Future<Either<Failure, Advice?>>? getAdvice();
}
