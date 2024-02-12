import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infocomsoft/functions/unzip_file.dart';
import 'package:infocomsoft/utils/file_details.dart';
import 'package:path_provider/path_provider.dart';

// call the http method to download the file and save it to a local directory

class DownloadAndSave {
  //download the file
  static Future<void> downloadAndSaveFile(String url) async {
    try {
      debugPrint("File download started");

      //Start downloading the file
      final response = await http.get(Uri.parse(url));
      final documentDirectory = await getApplicationDocumentsDirectory();
      final file = File('${documentDirectory.path}/${FileDetails.zipFileName}');

      //save it to local dir
      await file.writeAsBytes(response.bodyBytes);
      debugPrint("File downloaded and saved");
      debugPrint(file.path);

      //call the function to unzip the file
      await UnzipFile.unzipFile(file.path, documentDirectory);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
