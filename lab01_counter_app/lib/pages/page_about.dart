import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget
{
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Página Sobre'),
      ),
      body: Center
      (
        child: Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            ElevatedButton
            (
              onPressed: ()
              {
                Navigator.pop(context);
              },
              child: const Text('Página de Detalles'),
            ),
          ]
        )
      ),
    );
  }
}
