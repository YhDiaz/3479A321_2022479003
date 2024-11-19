import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:logger/logger.dart';
import 'package:lab01_counter_app/pages/page_home.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working!");

    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData
        (
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          fontFamily: 'Oswald'
        ),
        home: MyHomePage(title: 'Aplicación Contador'),
      )
    );
  }
}
