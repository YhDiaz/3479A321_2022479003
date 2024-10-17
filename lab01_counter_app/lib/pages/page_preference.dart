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
  String userName = '';
  double counter = 0;

  @override
  Widget build(BuildContext context) {
    context.read<AppData>().actions.add('Ubicación actual: Página preferencia');
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
                  Text('Nombre de usuario: $userName'),
                  const SizedBox(height: 10,),
                  TextFormField(
                    onFieldSubmitted: (value) => {
                      setState(() {
                        userName = value;
                        // print('User name is $userName');
                      })                      
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Container( // Counter and counter slider section.
              child: Column(
                children: [
                  Text('Contador: ${counter.round().toString()}'),
                  const SizedBox(height: 10,),
                  Slider(
                    value: counter,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        counter = value;
                      });
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
