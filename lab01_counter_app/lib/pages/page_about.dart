import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget
{
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    // context.read<AppData>().actions.add('Ubicación actual: Página sobre');
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Página Sobre'),
      ),
      body: Center
      (
        child: Padding
        (
          padding: const EdgeInsets.all(50.0),
          child: Text
          (
            'Aplicación desarrollada por Joel Díaz - Ingeniería en Desarrollo de Videojuegos y Realidad Virtual - Universidad de Talca',
          ),
        ),
      ),
      floatingActionButton: Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          const SizedBox(width: 30),
          ElevatedButton
          (
            onPressed: ()
            {
              Navigator.pop(context);
            },
            child: const Text('Página de Detalles'),
          ),
        ]
      ),
    );
  }
}
