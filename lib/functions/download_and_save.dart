import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// call the http method to download the file and save it to a local directory

class DownloadAndSave {
  static Future<void> downloadAndSaveFile(String url) async {
    try {
      debugPrint("File download started");
      final response = await http.get(Uri.parse(url));
      final documentDirectory = await getApplicationDocumentsDirectory();
      final file = File('${documentDirectory.path}/Machine_test_build.zip');
      await file.writeAsBytes(response.bodyBytes);
      debugPrint("File downloaded and saved");
      debugPrint(file.path);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
