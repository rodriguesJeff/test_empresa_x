import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advices_state.dart';

class AdvicesCubit extends Cubit<AdvicesState> {
  AdvicesCubit() : super(AdvicesInitial());
}
