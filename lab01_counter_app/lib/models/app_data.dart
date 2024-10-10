import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int counter = 0;
  List<String> actions = List.empty(growable: true);

  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter -= (counter - 1 < 0) ? 0 : 1;
  }

  void resetCounter() {
    counter = 0;
  }
}
