import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_iatec/features/advice/presentation/cubit/advices_cubit.dart';

class AdvicesPage extends StatelessWidget {
  const AdvicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AdvicesCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/logo.png',
          width: 50.0,
          height: 50.0,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<AdvicesCubit, AdvicesState>(
              builder: (c, state) {
                if (state is AdvicesInitial) {
                  return const Text('Clique abaixo');
                } else if (state is AdvicesLoaded) {
                  return Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        state.advice.advice,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ));
                }
                return const CircularProgressIndicator();
              },
            ),
            ElevatedButton(
              onPressed: () {
                cubit.getAdvice();
              },
              child: const Text('Get Advices'),
            ),
          ],
        ),
      ),
    );
  }
}
