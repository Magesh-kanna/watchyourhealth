// lib/src/shared/utils/shared_prefs_helper.dart

import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchyourhealth/src/core/constants/app_constants.dart';

class SharedPrefsHelper {
  static Future<void> saveUid(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await removeSharedPrefById(id: AppConstants.uidKey);
    await prefs.setString(AppConstants.uidKey, uid);
  }

  static Future<String> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.uidKey) ?? '';
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> removeSharedPrefById({required String id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(id);
  }
}
