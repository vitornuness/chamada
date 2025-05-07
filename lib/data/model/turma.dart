import 'package:chamada/data/model/model.dart';

class Turma extends Model<Turma> {
  final String codigo;

  Turma({required super.id, required this.codigo});

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'codigo': codigo};
  }

  factory Turma.fromMap(Map<String, dynamic> map) {
    return Turma(id: map['id'], codigo: map['codigo']);
  }

  @override
  Turma copyWith({int? id, String? codigo}) {
    return Turma(id: id ?? this.id, codigo: codigo ?? this.codigo);
  }
}
