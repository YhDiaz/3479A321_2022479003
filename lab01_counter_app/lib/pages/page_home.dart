import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

//Create an elevated button with a functionality and an icon
Widget footerButton(
  Function? onPressed,
  Widget? child
)
{
  return ElevatedButton
  (
    onPressed: () => onPressed!(),
    child: child
  );
}

//Create a floating button witha a functionality, a tooltip and an icon
Widget floatingButton(
  Function? onPressed_,
  String? tooltip_,
  Widget? child_
)
{
  return FloatingActionButton
  (
    onPressed: () => onPressed_!(),
    tooltip: tooltip_,
    child: child_
  );
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  int _counter = 0;
  String messageResult = "Presiona algún botón para jugar";

  void _incrementCounter()
  {
    setState(()
    {
      _counter++;

      if (_counter == 5) messageResult = "Has perdido!";
      else if (_counter == 10) messageResult = "Has ganado!";
    });
  }

  void _decrementCounter()
  {
    setState(()
    {
      _counter = _counter - 1 > 0 ? _counter - 1 : 0;

      if (_counter == 5) messageResult = "Has perdido!";
      else if (_counter == 10) messageResult = "Has ganado!";
    });
  }

  void _resetCounter()
  {
    setState(()
    {
      _counter = 0;
      messageResult = "Contador reiniciado";
    });
  }

  @override
  Widget build(BuildContext context)
  {
    var logger = Logger();
    logger.d("Logger is working!");

    return Scaffold
    (
      persistentFooterButtons:
      [
        footerButton(_decrementCounter, const Icon(Icons.remove)), //Footer button to decrement counter value
        footerButton(_incrementCounter, const Icon(Icons.add)), //Footer button to increment counter value
      ],
      appBar: AppBar
      (
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
            SvgPicture.asset
            (
              'assets/icons/icon_game.svg',
              semanticsLabel: 'Acme Logo'
            ),
            Text
            (
              messageResult,
            ),
            Text
            (
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      floatingActionButton: floatingButton(_resetCounter, 'Reiniciar', const Icon(Icons.refresh)) //Floating button to reset counter value
    );
  }
}
