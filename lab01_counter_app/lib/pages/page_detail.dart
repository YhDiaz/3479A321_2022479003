import 'package:flutter/material.dart';
import 'package:lab01_counter_app/pages/page_about.dart';

class DetailPage extends StatelessWidget
{
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Página de Detalles'),
      ),
      body: Center
      (
        child: Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            ElevatedButton //Back to home page
            (
              onPressed: ()
              {
                Navigator.pop(context);
              },
              child: const Text('Página Principal'),
            ),
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
        )
      ),
    );
  }
}
