import 'package:git_users/core/adapters/shared_preferences/shared_prefs_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs implements ISharedPreferences {
  SharedPreferences? _prefs;

  Future _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveString(
      {required String json, required String objectName}) async {
    if (_prefs == null) await _initPrefs();
    await _prefs!.setString(objectName, json);
  }

  @override
  String? getString({required String objectName}) {
    return _prefs?.getString(objectName);
  }
}
