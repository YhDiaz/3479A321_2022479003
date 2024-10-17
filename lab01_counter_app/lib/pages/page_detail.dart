import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:lab01_counter_app/pages/page_about.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget
{
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    context.read<AppData>().actions.add('Ubicación actual: Página detalle');
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Página de Detalles'),
      ),
      body: Center
      (
        child: Column(
          children: [
            Padding
            (
              padding: const EdgeInsets.all(50.0),
              child: Text
              (
                'Esta aplicación corresponde al Laboratorio 03 del módulo Programación para Dispositivos Móviles, el cual busca implementar un card y navegación entre pantallas, principalmente',
              ),
            ),
            const SizedBox(height: 10,),
            Text('Contador: ${context.read<AppData>().counter}')
          ],
        ),
      ),
      floatingActionButton: Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          const SizedBox(width: 30),
          ElevatedButton //Back to home page
          (
            onPressed: ()
            {
              Navigator.pop(context);
            },
            child: const Text('Página Principal'),
          ),
          const SizedBox(width: 15), //Space between buttons
          ElevatedButton //Go to about page
          (
            child: const Text('Página Sobre'),
            onPressed: ()
            {
              Navigator.push
              (
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            }
          ),
        ]
      ),
    );
  }
}
