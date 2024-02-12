import 'package:flutter/material.dart';
import 'package:infocomsoft/functions/check_file_status.dart';
import 'package:infocomsoft/functions/file_path_function.dart';
import 'package:infocomsoft/screens/downloading_page.dart';
import 'package:infocomsoft/screens/web_wiew_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            if (await CheckFileStatus.isFileExist()) {
              String? path = await StorageFilePath.getFilePath();
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebViewScreen(
                      path: path!,
                    ),
                  ));
            } else {
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DownloadingPage(),
                  ));
            }
          },
          child: Container(
            width: size.width * 0.5,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                "Play",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
