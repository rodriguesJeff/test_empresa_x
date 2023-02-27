part of 'advices_cubit.dart';

abstract class AdvicesState extends Equatable {
  const AdvicesState();

  @override
  List<Object> get props => [];
}

class AdvicesInitial extends AdvicesState {}

class AdvicesLoading extends AdvicesState {}

class AdvicesLoaded extends AdvicesState {
  final Advice advice;
  const AdvicesLoaded({required this.advice});
}
