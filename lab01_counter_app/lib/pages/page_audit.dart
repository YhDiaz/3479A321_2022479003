import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/audit.dart';
import 'package:lab01_counter_app/utils/database_helper.dart';
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

  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  List<Audit> audits = [];

  @override
  Widget build(BuildContext context) {
    
    databaseHelper.insert(Audit(id: 0, action: 'Ubicación actual: Página auditoría'));
    databaseHelper.read().then((value) {
      setState(() {
        audits = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Auditoría'),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: List.generate(audits.length, (int index) {
            return Container(
              height: 50,
              color: Colors.amber[600],
              child: Center(
                child: Text(audits[index].action)
              ),
            );
          })
        ),
      ),
    );
  }
}

