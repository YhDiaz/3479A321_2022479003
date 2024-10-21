import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:logger/logger.dart';
import 'package:lab01_counter_app/pages/page_home.dart';
import 'package:provider/provider.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const MyHomePage(title: 'Aplicación Contador - Página Principal'),
      )
    );
  }
}
