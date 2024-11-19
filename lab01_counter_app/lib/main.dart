// import 'package:camera/camera.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:lab01_counter_app/models/holiday.dart';
import 'package:logger/logger.dart';
import 'package:lab01_counter_app/pages/page_home.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:http/http.dart' as http;

// Future<List<Holiday>> fetchHolidays() async {
//   final response = await http.get(Uri.parse('https://apis.digital.gob.cl/fl/feriados/2024'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     // print(jsonDecode(response.body));
//     final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
//     print(jsonData);
//     return jsonData.map((json) => Holiday.fromJson(json as Map<String, dynamic>)).toList();
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load holidays');
//   }
// }

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
        // home: MyHomePage(title: 'Aplicación Contador - Página Principal', camera: firstCamera,),
        // home: TakePictureScreen(camera: firstCamera),
      )
    );
  }
}
