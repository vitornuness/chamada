import 'package:chamada/data/service/preferences_service.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  final _preferencesService = PreferencesService.instance;

  final baseUrl = 'http://localhost:8080/';
  late String token = 'Bearer ${_preferencesService.getTokenIdentificacao()}';

  Future<http.Response> post(String uri, String? body) async {
    try {
      return await http.post(
        Uri.http('$baseUrl$uri'),
        body: body,
        headers: {'Authorization': token},
      );
    } catch (e) {
      throw Exception(
        "Não foi possível enviar dados da url: $baseUrl$uri\n Causado por: ${e.toString()}",
      );
    }
  }

  Future<http.Response> get(String uri, {Map<String, dynamic>? params}) async {
    try {
      return await http.get(
        Uri.http('$baseUrl$uri'),
        headers: {'Authorization': token},
      );
    } catch (e) {
      throw Exception(
        "Não foi possível recuperar dados da url: $baseUrl$uri\n Causado por: ${e.toString()}",
      );
    }
  }
}
