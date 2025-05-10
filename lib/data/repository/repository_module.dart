import 'package:chamada/data/repository/aluno_repository.dart';
import 'package:chamada/data/repository/justificativa_repository.dart';
import 'package:chamada/data/repository/registro_repository.dart';
import 'package:chamada/data/repository/reserva_repository.dart';
import 'package:chamada/data/repository/sala_repository.dart';
import 'package:chamada/data/repository/turma_repository.dart';
import 'package:chamada/data/repository/usuario_repository.dart';

class RepositoryModule {
  static AlunoRepository? _alunoRepository;
  static JustificativaRepository? _justificativaRepository;
  static RegistroRepository? _registroRepository;
  static ReservaRepository? _reservaRepository;
  static SalaRepository? _salaRepository;
  static TurmaRepository? _turmaRepository;
  static UsuarioRepository? _usuarioRepository;

  static AlunoRepository get alunoRepository {
    _alunoRepository ??= AlunoRepository();
    return _alunoRepository!;
  }

  static JustificativaRepository get justificativaRepository {
    _justificativaRepository ??= JustificativaRepository();
    return _justificativaRepository!;
  }

  static RegistroRepository get registroRepository {
    _registroRepository ??= RegistroRepository();
    return _registroRepository!;
  }

  static ReservaRepository get reservaRepository {
    _reservaRepository ??= ReservaRepository();
    return _reservaRepository!;
  }

  static SalaRepository get salaRepository {
    _salaRepository ??= SalaRepository();
    return _salaRepository!;
  }

  static TurmaRepository get turmaRepository {
    _turmaRepository ??= TurmaRepository();
    return _turmaRepository!;
  }

  static UsuarioRepository get usuarioRepository {
    _usuarioRepository ??= UsuarioRepository();
    return _usuarioRepository!;
  }
}
