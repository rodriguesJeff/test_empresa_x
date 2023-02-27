import 'package:teste_iatec/features/advice/domain/entities/advice.dart';

abstract class AdviceRemoteDataSource {
  Future<Advice>? getAdvice();
}
