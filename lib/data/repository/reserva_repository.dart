import 'package:chamada/data/database/dao/reserva_dao.dart';
import 'package:chamada/data/model/reserva.dart';
import 'package:chamada/data/repository/crud_repository.dart';

class ReservaRepository extends CrudRepository<Reserva> {
  ReservaRepository(): super(ReservaDao());
}