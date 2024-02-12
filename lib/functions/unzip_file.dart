//function to unzip the downloaded file from path and save it to new path,
// Also save the path of extracted file

import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:infocomsoft/functions/file_path_function.dart';
import 'package:infocomsoft/utils/file_details.dart';

class UnzipFile {
  static Future<void> unzipFile(
      String zipFilePath, Directory destinationDir) async {
    try {
      //Start unzipping add save to dir
      await ZipFile.extractToDirectory(
        zipFile: File(zipFilePath),
        destinationDir: destinationDir,
      );
      StorageFilePath.saveFilePath(
          filePath:
              "${destinationDir.path}/${FileDetails.folderName}/index.html");

      print('File unzipped successfully');
    } catch (e) {
      print('Error unzipping file: $e');
    }
  }
}
