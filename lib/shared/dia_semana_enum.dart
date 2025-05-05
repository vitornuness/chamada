enum DiaSemanaEnum {
  segunda('SEGUNDA'),
  terca('TERÇA'),
  quarta('QUARTA'),
  quinta('QUINTA'),
  sexta('SEXTA'),
  sabado('SABADO'),
  domingo('DOMINGO');

  final String _nome;

  const DiaSemanaEnum(this._nome);

  String get getNome => _nome;
}
