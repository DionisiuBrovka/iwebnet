import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inetweb/data/utils/strings_const.dart';
import 'package:inetweb/domain/apps/main_app.dart';
import 'package:path_provider/path_provider.dart';

Future<void> setup() async {
  await Hive.initFlutter();

  final String hiveDocumentFolderPath =
      "${(await getApplicationDocumentsDirectory()).path}/$HIVE_BOX_FOLDER_NAME";

  await Hive.openBox(NETWORK_NODE_HIVE_BOX_NAME, path: hiveDocumentFolderPath);
  await Hive.openBox(NETWORK_EDGE_HIVE_BOX_NAME, path: hiveDocumentFolderPath);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}
