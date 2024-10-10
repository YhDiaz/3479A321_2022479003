import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

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
    context.read<AppData>().actions.add('Ubicación actual: Página auditoría');
    return Scaffold(
      appBar: AppBar(
        title: Text('Auditoría'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: List.generate(context.read<AppData>().actions.length, (int index) {
              // return Text(context.read<AppData>().actions[index]);
              return Container(
                height: 50,
                color: Colors.amber[600],
                child: Center(
                  child: Text(context.read<AppData>().actions[index])
                ),
              );
            })
            
            // Container(
            //   height: 50,
            //   color: Colors.amber[600],
            //   child: const Center(child: Text('Hola')),
            // ),
            // const SizedBox(height: 5,),
        ),
      ),
    );
  }
}

