// To check weather the file is available locally or not

import 'dart:io';

import 'package:infocomsoft/functions/file_path_function.dart';

class CheckFileStatus {
  static Future<bool> isFileExist() async {
    String? filePath = await StorageFilePath.getFilePath();
    print(filePath);
    if (filePath == null) {
      return false;
    }

    File file = File(filePath);
    return file.existsSync();
  }
}
