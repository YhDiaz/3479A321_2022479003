import 'package:flutter/material.dart';

class HolidaysPage extends StatefulWidget {
  const HolidaysPage({super.key, required this.year});

  final int year;

  @override
  State<HolidaysPage> createState() => _HolidaysPageState();
}

class _HolidaysPageState extends State<HolidaysPage> {
  List<String> holidays = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Año ${widget.year}'),
      ),
    );
  }
}