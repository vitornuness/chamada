import 'package:chamada/data/model/model.dart';

class Justificativa extends Model<Justificativa> {
  final int registroId;
  final String texto;
  final String data;

  Justificativa({
    required super.id,
    required this.registroId,
    required this.texto,
    required this.data,
  });

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'registroId': registroId, 'texto': texto, 'data': data};
  }

  static Justificativa fromMap(Map<String, dynamic> map) {
    return Justificativa(
      id: map['id'],
      registroId: map['registroId'],
      texto: map['texto'],
      data: map['data'],
    );
  }

  @override
  Justificativa copyWith({
    int? id,
    int? registroId,
    String? texto,
    String? data,
  }) {
    return Justificativa(
      id: id ?? this.id,
      registroId: registroId ?? this.registroId,
      texto: texto ?? this.texto,
      data: data ?? this.data,
    );
  }
}
