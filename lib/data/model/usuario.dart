import 'package:chamada/data/model/model.dart';

class Usuario extends Model<Usuario> {
  final String usuario;
  final String senha;
  final String nome;
  final bool ehAdmin;

  Usuario({
    required super.id,
    required this.usuario,
    required this.senha,
    required this.nome,
    required this.ehAdmin,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'senha': senha,
      'nome': nome,
      'ehAdmin': ehAdmin,
    };
  }

  static Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      usuario: map['usuario'],
      senha: map['senha'],
      nome: map['nome'],
      ehAdmin: map['ehAdmin'],
    );
  }

  @override
  Usuario copyWith({
    int? id,
    String? usuario,
    String? senha,
    String? nome,
    bool? ehAdmin,
  }) {
    return Usuario(
      id: id ?? this.id,
      usuario: usuario ?? this.usuario,
      senha: senha ?? this.senha,
      nome: nome ?? this.nome,
      ehAdmin: ehAdmin ?? this.ehAdmin,
    );
  }
}
