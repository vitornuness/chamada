import 'dart:convert';

import 'package:chamada/data/api/api.dart';

class LoginApi extends Api {
  Future<Map<String, dynamic>> login(String usuario, String senha) async {
    final uri = 'v1/login';

    try {
      final response = await post(
        uri,
        jsonEncode({'usuario': usuario, 'senha': senha}),
      );

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }

      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
