//function to save the unzipped file path
// file to retrive the file path

import 'package:shared_preferences/shared_preferences.dart';

class StorageFilePath{
  static const String _filePathKey = 'filePath';

  static Future<void> saveFilePath({required String filePath}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_filePathKey, filePath);
  }

  static Future<String?> getFilePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_filePathKey);
  }
}