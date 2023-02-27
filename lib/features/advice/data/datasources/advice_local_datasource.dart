import 'package:teste_iatec/features/advice/domain/entities/advice.dart';

abstract class AdviceLocalDataSource {
  Future<Advice>? getLastAdvice();
  Future<void>? cacheAdvice(Advice advice);
}
