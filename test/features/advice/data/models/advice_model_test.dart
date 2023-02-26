import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:teste_iatec/features/advice/data/models/advice_model.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const adviceModel =
      AdviceModel(id: 5, advice: 'If you have the chance, take it!');

  test('Deve ser uma subclasse da entidade Advice', () async {
    expect(adviceModel, isA<Advice>());
  });

  test('Deve retornar um model valido a partir de um json - fromJson',
      () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('advice.json'));
    // act
    final result = AdviceModel.fromJson(jsonMap['slip']);
    // assert
    expect(result, adviceModel);
  });

  test('Deve retornar um json com um advice valido - toJson', () async {
    // act
    final result = adviceModel.toJson();

    // assert
    final expectJson = {
      "id": 5,
      "advice": "If you have the chance, take it!",
    };
    expect(result, expectJson);
  });
}
