abstract class ISharedPreferences {
  Future<void> saveString({required String json, required String objectName});
  String? getString({required String objectName});
}
