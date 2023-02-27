import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_iatec/features/advice/domain/usecases/get_advice_usecase.dart';
import 'package:teste_iatec/features/advice/presentation/cubit/advices_cubit.dart';
import 'package:teste_iatec/features/advice/presentation/pages/advices_page.dart';
import 'package:teste_iatec/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IATEC TEST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider.value(
        value: AdvicesCubit(usecase: getIt.get<GetAdvice>()),
        child: const AdvicesPage(),
      ),
    );
  }
}
