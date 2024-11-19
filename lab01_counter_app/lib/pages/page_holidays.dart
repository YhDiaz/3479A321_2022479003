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

Future<List<Holiday>> fetchHolidays(int year) async {
  final response = await http.get(Uri.parse('https://apis.digital.gob.cl/fl/feriados/$year'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print(jsonDecode(response.body));
    final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
    print(jsonData);
    return jsonData.map((json) => Holiday.fromJson(json as Map<String, dynamic>)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load holidays');
  }
}

class HolidaysPage extends StatefulWidget {
  const HolidaysPage({super.key, required this.year});
  
  final int year;

  @override
  State<StatefulWidget> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  late Future<List<Holiday>> futureHoliday;

  @override
  void initState() {
    super.initState();
    futureHoliday = fetchHolidays(widget.year);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Feriados Chile - ${widget.year}'),
        ),
        body: Center(
          child: FutureBuilder<List<Holiday>>(
            future: futureHoliday,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Holiday> holidays = snapshot.data!;
                return ListView.builder(
                  itemCount: holidays.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(holidays[index].name),
                      subtitle: holidays[index].cantWork ?
                        Text('${holidays[index].date} (${holidays[index].type} - Feriado irrenunciable)')
                      :
                        Text('${holidays[index].date} (${holidays[index].type} - Feriado no irrenunciable)')
                    );
                  },
                );
              } else {
                return const Text('No se encontrarion feriados');
              }
            },
          ),
        ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:lab01_counter_app/models/holiday.dart';

// class HolidaysPage extends StatefulWidget {
//   const HolidaysPage({super.key, required this.year, required this.holidays});

//   final int year;
//   final Future<List<Holiday>> holidays;

//   @override
//   State<HolidaysPage> createState() => _HolidaysPageState();
// }

// class _HolidaysPageState extends State<HolidaysPage> {
//   List<String> holidays = List.empty(growable: true);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Año ${widget.year}'),
//       ),
//       body: Center(
//           child: FutureBuilder<List<Holiday>>(
//             future: widget.holidays,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else if (snapshot.hasData) {
//                 List<Holiday> holidays = snapshot.data!;
//                 return ListView.builder(
//                   itemCount: holidays.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(holidays[index].name),
//                       subtitle: Text('${holidays[index].date} (${holidays[index].type})'),
//                       trailing: Text(holidays[index].cantWork ? 'Irreducible' : 'Non-irrenunciable'),
//                     );
//                   },
//                 );
//               } else {
//                 return const Text('No holidays found');
//               }
//             },
//           ),
//         ),
//     );
//   }
// }