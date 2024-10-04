
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab01_counter_app/pages/page_detail.dart';
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
  State<MyHomePage> createState() {
    var logger = Logger();
    logger.d("Hello from create state method!");    
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
{
  final Logger logger = Logger();

  _MyHomePageState() {
    logger.d('mounted variable is $mounted!');
  }

  int _counter = 0;
  String messageResult = "Presiona algún botón para jugar";
  String defaultIcon = 'assets/icons/icon_game.svg';
  String winIcon = 'assets/icons/icon_win.svg';
  String defeatIcon = 'assets/icons/icon_defeat.svg';
  String icon = 'assets/icons/icon_game.svg';
  static ChildCounterWidget childCounter = ChildCounterWidget(counter: 0);

  void _incrementCounter()
  {
    setState(()
    {
      _counter++;

      if (_counter == 5)
      {
        messageResult = "Has perdido!";
        icon = defeatIcon;
      }
      else if (_counter == 10)
      {
        messageResult = "Has ganado!";
        icon = winIcon;
      }
    });
  }

  void _decrementCounter()
  {
    setState(()
    {
      _counter = _counter - 1 > 0 ? _counter - 1 : 0;

      if (_counter == 5)
      {
        messageResult = "Has perdido!";
        icon = defeatIcon;
      }
      else if (_counter == 10)
      {
        messageResult = "Has ganado!";
        icon = winIcon;
      }
    });
  }

  void _resetCounter()
  {
    setState(()
    {
      _counter = 0;
      messageResult = "Contador reiniciado";
      icon = defaultIcon;
    });
  }

  @override
  void initState() {
    super.initState();
    logger.d('Home page was already included in tree using init State method!');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    logger.d('Dependencies in home page has changed!');
  }

  @override void setState(VoidCallback fn) {
    super.setState(fn);
    logger.d('Rebuilding widget due to change in state!');
  }

  @override void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.d('Rebuiling widget comparing old widget with the new one!');
  }

  @override void deactivate() {
    super.deactivate();
    logger.d('Widget removed temporarily!');
  }

  @override
  void dispose() {
    super.dispose();
    logger.d('Widget removed permanently!');
  }

  @override
  void reassemble() {
    super.reassemble();
    logger.d('Hot reloading app!');
  }

  @override
  Widget build(BuildContext context)
  {
    logger.d("Home page build method was overrided and now mounted is $mounted!");

    return Scaffold
    (
      // persistentFooterButtons:
      // [
      //   footerButton(_decrementCounter, const Icon(Icons.remove)), //Footer button to decrement counter value
      //   footerButton(_incrementCounter, const Icon(Icons.add)), //Footer button to increment counter value
      // ],
      appBar: AppBar
      (
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center
      (
        child: Card
        (
          elevation: 10, //Shadow
          
          child: Column
          (
            
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>
            [
              SvgPicture.asset
              (
                icon,
                height: 50,
                semanticsLabel: 'Acme Logo'
              ),
              Padding
              (
                padding: const EdgeInsets.all(50.0),
                child: Text
                (
                  messageResult,
                ),
              ),
              Text
              (
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ChildCounterWidget(counter: _counter),
              Row //Row for space between counter and buttons
              (
                children:
                [
                  const SizedBox(height: 50)
                ],
              ),
              Row //Row for buttons
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>
                [
                  footerButton(_decrementCounter, const Icon(Icons.remove)), //Footer button to decrement counter value
                  const SizedBox(width: 8),
                  footerButton(_resetCounter, const Icon(Icons.refresh)), //Footer button to reset counter value
                  const SizedBox(width: 8),
                  footerButton(_incrementCounter, const Icon(Icons.add)), //Footer button to increment counter value
                ],
              ),
              Row //Row for space between buttons and bottom
              (
                children:
                [
                  const SizedBox(height: 8)
                ],
              )
            ],
          ),
        )
      ),
      floatingActionButton: ElevatedButton
      (
        child: const Text('Página de Detalles'),
        onPressed: ()
        {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DetailPage())
          );
        },
      ),
      // floatingActionButton: floatingButton(_resetCounter, 'Reiniciar', const Icon(Icons.refresh)) //Floating button to reset counter value
    );
  }
}

class ChildCounterWidget extends StatefulWidget {
  const ChildCounterWidget({super.key, required this.counter});
  final int counter;

  @override
  State<StatefulWidget> createState() => _ChildCounterWidgetState(counter);
}

class _ChildCounterWidgetState extends State<ChildCounterWidget> {

  static int counter = 0;

  _ChildCounterWidgetState(int _counter) {
    counter = _counter;
  }

  @override
  void didUpdateWidget(covariant ChildCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    Logger logger = Logger();
    logger.d('Child widget update');
  }

  @override
  Widget build(BuildContext context) {
    return Text('Child counter: $counter');
  }
}
