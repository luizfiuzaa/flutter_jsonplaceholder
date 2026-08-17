import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'core/database/app_database.dart';
import 'core/network/dio_factory.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await AppDatabase.open();

  runApp(AppWidget(database: database, dio: DioFactory.create()));
}
