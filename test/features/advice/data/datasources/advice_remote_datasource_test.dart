import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:teste_iatec/core/error/exceptions.dart';
import 'package:teste_iatec/features/advice/data/datasources/advice_remote_datasource_impl.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late AdviceRemoteDataSourceImpl datasource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = AdviceRemoteDataSourceImpl(client: mockHttpClient);
  });

  const advice = Advice(id: 5, advice: 'If you have the chance, take it!');

  test('Deve retornar um conselho a partir da api, voltando em json', () async {
    // arrange
    when(mockHttpClient.get(Uri.parse('any'), headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => http.Response(fixture('advice_clean.json'), 200),
    );

    datasource.getAdvice();
    // assert
    verify(mockHttpClient.get(
      Uri.https('https://api.adviceslip.com/advice'),
      headers: {'Content-Type': 'application/json'},
    ));
  });
  // act

  test('Deve retornar um conselho valido quando o status code for 200',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(''), headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => http.Response(fixture('advice_clean.json'), 200),
    );
    // act
    final result = await datasource.getAdvice();
    // assert
    expect(result, equals(advice));
  });

  test(
      'Deve retornar uma ServerException quando o status for igual a 404 ou outro',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(''), headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
    // act
    final call = datasource.getAdvice();
    // assert
    expect(() => call, throwsA(const TypeMatcher<ServerException>()));
  });
}
