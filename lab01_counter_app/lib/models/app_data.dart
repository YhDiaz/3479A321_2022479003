import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int counter = 0;
  List<String> actions = List.empty(growable: true);

  void incrementCounter() {
    counter++;
    addAction('Se incrementó en 1 el contador y ahora es $counter');
  }

  void decrementCounter() {
    counter -= (counter - 1 < 0) ? 0 : 1;
    addAction('Se decrementó en 1 el contador y ahora es $counter');
  }

  void resetCounter() {
    counter = 0;
    addAction('Se reinició el contador, por lo tanto ahora es $counter');
  }

  void addAction(String action) {
    actions.add(action);
  }
}
