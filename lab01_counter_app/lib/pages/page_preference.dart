import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class PreferencePage extends StatefulWidget
{
  const PreferencePage({super.key, required this.title});
  final String title;

  @override
  State<PreferencePage> createState() {
    var logger = Logger();
    logger.d("Hello from create state method!");   
    return _PreferencePageState();
  }
}

class _PreferencePageState extends State<PreferencePage> {

  @override
  Widget build(BuildContext context) {
    context.read<AppData>().actions.add('Ubicación actual: Página preferencia');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencia'),
      ),
    );
  }
}
