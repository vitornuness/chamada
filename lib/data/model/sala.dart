import 'package:chamada/data/model/model.dart';

class Sala extends Model<Sala> {
  final String codigo;
  final String? ipAparelho;

  Sala({required super.id, required this.codigo, this.ipAparelho});

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'codigo': codigo, 'ipAparelho': ipAparelho};
  }

  factory Sala.fromMap(Map<String, dynamic> map) {
    return Sala(
      id: map['id'],
      codigo: map['codigo'],
      ipAparelho: map['ipAparelho'],
    );
  }

  @override
  Sala copyWith({int? id, String? codigo, String? ipAparelho}) {
    return Sala(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      ipAparelho: ipAparelho ?? this.ipAparelho,
    );
  }
}
