class Usuario {
  final int id;
  final String usuario;
  final String senha;
  final String nome;
  final bool ehAdmin;

  Usuario({
    required this.id,
    required this.usuario,
    required this.senha,
    required this.nome,
    required this.ehAdmin,
  });

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
