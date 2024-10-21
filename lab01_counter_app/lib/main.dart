import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:lab01_counter_app/models/audit.dart';
import 'package:logger/logger.dart';
import 'package:lab01_counter_app/pages/page_home.dart';
import 'package:provider/provider.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  // final database = openDatabase(
  //   // Set the path to the database. Note: Using the `join` function from the
  //   // `path` package is best practice to ensure the path is correctly
  //   // constructed for each platform.
  //   join(await getDatabasesPath(), 'audits.db'),
  //   onCreate: (db, version) {
  //     // Run the CREATE TABLE statement on the database.
  //     return db.execute(
  //       'CREATE TABLE audits(id INTEGER PRIMARY KEY, action TEXT)',
  //     );
  //   },
  //   // Set the version. This executes the onCreate function and provides a
  //   // path to perform database upgrades and downgrades.
  //   version: 1,
  // );

  // Future<void> insertAudit(Audit dog) async {
  //   final db = await database;
  //   await db.insert(
  //     'audits',
  //     dog.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // var fido = Audit(
  //   id: 0,
  //   action: 'hola'
  // );

  // await insertAudit(fido);

  // // A method that retrieves all the dogs from the dogs table.
  // Future<List<Audit>> dogs() async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Query the table for all the dogs.
  //   final List<Map<String, Object?>> dogMaps = await db.query('dogs');

  //   // Convert the list of each dog's fields into a list of `Dog` objects.
  //   return [
  //     for (final {
  //           'id': id as int,
  //           'action': action as String,
  //         } in dogMaps)
  //       Audit(id: id, action: action),
  //   ];
  // }

  // // Now, use the method above to retrieve all the dogs.
  // print(await dogs()); // Prints a list that include Fido.
// }

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

    // return MaterialApp
    // (
    //   title: 'Counter App',
    //   theme: ThemeData
    //   (
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
    //     useMaterial3: true,
    //     fontFamily: 'Oswald'
    //   ),
    //   home: const MyHomePage(title: 'Aplicación Contador - Página Principal'),
    // );
  }
}
