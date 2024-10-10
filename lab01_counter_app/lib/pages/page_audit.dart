import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuditPage extends StatefulWidget {
  const AuditPage({super.key, required this.title});

  final String title;

  @override
  State<AuditPage> createState() {
    var logger = Logger();
    logger.d("Hello from create state method!");    
    return _AuditPageState();
  }
}

class _AuditPageState extends State<AuditPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auditoría'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            // Container(
            //   height: 50,
            //   color: Colors.amber[600],
            //   child: const Center(child: Text('Hola')),
            // ),
            // const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}

