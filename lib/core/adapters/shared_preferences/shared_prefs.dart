import 'package:git_users/core/adapters/shared_preferences/shared_prefs_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs implements ISharedPreferences {
  SharedPreferences? _prefs;

  Future _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveString(
      {required String json, required String objectName}) async {
    await _initPrefs();
    await _prefs!.setString(objectName, json);
  }

  @override
  Future<String?> getString({required String objectName}) async {
    await _initPrefs();
    return _prefs?.getString(objectName);
  }
}
