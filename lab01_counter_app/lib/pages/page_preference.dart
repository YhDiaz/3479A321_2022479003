import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/audit.dart';
import 'package:lab01_counter_app/utils/database_helper.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String _userName = '';
  double _counter = 0;

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? '';
      _counter = prefs.getDouble('counter') ?? 0;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    databaseHelper.insert(Audit(action: 'Se modificaron los valores del nombre de usuario y contador'));
    setState(() {
      prefs.setString('userName', _userName);
      prefs.setDouble('counter', _counter);

      print('Setting username as $_userName');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencia'),
      ),
      body: Center(
        child: Column(
          children: [
            Container( // User name and text form field section.
              child: Column(
                children: [
                  Text('Nombre de usuario: $_userName'),
                  const SizedBox(height: 10,),
                  TextFormField(
                    onFieldSubmitted: (value) {
                      setState(() {
                        _userName = value;
                      });
                      _savePreferences();           
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Container( // Counter and counter slider section.
              child: Column(
                children: [
                  Text('Contador: ${_counter.round().toString()}'),
                  const SizedBox(height: 10,),
                  Slider(
                    value: _counter,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _counter = value;
                      });
                      _savePreferences();
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
