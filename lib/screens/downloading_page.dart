import 'package:flutter/material.dart';
import 'package:infocomsoft/functions/download_and_save.dart';
import 'package:infocomsoft/functions/file_path_function.dart';
import 'package:infocomsoft/screens/web_wiew_screen.dart';
import 'package:infocomsoft/utils/urls.dart';

class DownloadingPage extends StatefulWidget {
  const DownloadingPage({super.key});

  @override
  State<DownloadingPage> createState() => _DownloadingPageState();
}

class _DownloadingPageState extends State<DownloadingPage> {
  @override
  void initState() {
    downloadAndSave();
    super.initState();
  }

  void downloadAndSave() async {
    await DownloadAndSave.downloadAndSaveFile(Urls.fileUrl);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
    String? path = await StorageFilePath.getFilePath();
    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewScreen(
            path: path!,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Downloading..."),
      ),
    );
  }
}
