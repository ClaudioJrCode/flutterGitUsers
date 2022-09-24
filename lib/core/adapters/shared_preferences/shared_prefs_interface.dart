abstract class ISharedPreferences {
  Future<void> saveString({required String json, required String objectName});
  Future<String?> getString({required String objectName});
}
