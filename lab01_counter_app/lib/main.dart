import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:lab01_counter_app/pages/page_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    var logger = Logger();
    logger.d("Logger is working!");

    return MaterialApp
    (
      title: 'Counter App',
      theme: ThemeData
      (
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
        fontFamily: 'Oswald'
      ),
      home: const MyHomePage(title: 'Aplicación Contador - Página Principal'),
    );
  }
}
