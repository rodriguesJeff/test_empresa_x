import 'package:equatable/equatable.dart';

class Advice extends Equatable {
  final int? id;
  final String? advice;

  const Advice({this.id, this.advice});

  @override
  List<Object?> get props => [id, advice];
}
