import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static PreferencesService? _instace;
  static SharedPreferences? _preferences;

  static const String _tokenUsuario = 'token_usuario';

  PreferencesService._internal();

  static PreferencesService get instance {
    _instace ??= PreferencesService._internal();
    return _instace!;
  }

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setTokenUsuario(int token) async {
    return await _preferences?.setInt(_tokenUsuario, token) ?? false;
  }

  int? getTokenUsuario() {
    return _preferences?.getInt(_tokenUsuario);
  }

  Future<bool> clearAllPreferences() async {
    return await _preferences?.clear() ?? false;
  }
}
