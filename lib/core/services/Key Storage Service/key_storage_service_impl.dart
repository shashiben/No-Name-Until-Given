import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/app/locator.dart';
import 'package:template/core/services/Key%20Storage%20Service/key_storage_service.dart';

class KeyStorageServiceImpl extends KeyStorageService {
  final SharedPreferences _preferences = locator<SharedPreferences>();
  Future saveToDisk<T>(String key, T content) async {
    if (content is String) {
      await _preferences.setString(key, content);
    }
    if (content is bool) {
      await _preferences.setBool(key, content);
    }
    if (content is int) {
      await _preferences.setInt(key, content);
    }
    if (content is double) {
      await _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences.setStringList(key, content);
    }
  }

  getValue(String key) {
    return _preferences.get(key) ?? null;
  }
}
