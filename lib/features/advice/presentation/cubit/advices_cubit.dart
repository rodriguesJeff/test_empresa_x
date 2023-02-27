import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:teste_iatec/features/advice/domain/entities/advice.dart';
import 'package:teste_iatec/features/advice/domain/usecases/get_advice_usecase.dart';

part 'advices_state.dart';

class AdvicesCubit extends Cubit<AdvicesState> {
  final GetAdvice usecase;
  AdvicesCubit({required this.usecase}) : super(AdvicesInitial());

  getAdvice() async {
    emit(AdvicesLoading());
    final advice = await usecase();
    if (advice != null) {
      advice.fold(
        (l) {
          emit(AdvicesInitial());
        },
        (r) {
          if (r != null) {
            emit(AdvicesLoaded(advice: r));
          }
        },
      );
    } else {
      emit(AdvicesInitial());
    }
  }
}
