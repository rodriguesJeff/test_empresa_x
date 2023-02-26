import 'package:teste_iatec/features/advice/domain/entities/advice.dart';

class AdviceModel extends Advice {
  const AdviceModel({
    required int id,
    required String advice,
  }) : super(
          id: id,
          advice: advice,
        );

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(id: json['id'], advice: json['advice']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'advice': advice,
    };
  }
}
