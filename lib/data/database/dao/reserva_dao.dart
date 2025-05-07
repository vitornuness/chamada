import 'package:chamada/data/database/dao/base_dao.dart';
import 'package:chamada/data/model/reserva.dart';

class ReservaDao extends BaseDao<Reserva> {
  ReservaDao(): super('reserva', Reserva.fromMap);
}