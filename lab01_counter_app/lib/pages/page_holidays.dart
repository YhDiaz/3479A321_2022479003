import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/holiday.dart';
import 'package:http/http.dart' as http;

Future<List<Holiday>> fetchHolidays(int year) async {
  final response = await http.get(Uri.parse('https://apis.digital.gob.cl/fl/feriados/$year'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;
    return jsonData.map((json) => Holiday.fromJson(json as Map<String, dynamic>)).toList();
  } else {
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
