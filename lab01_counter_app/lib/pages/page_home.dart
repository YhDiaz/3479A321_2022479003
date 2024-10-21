import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:lab01_counter_app/models/audit.dart';
import 'package:lab01_counter_app/pages/page_about.dart';
import 'package:lab01_counter_app/pages/page_audit.dart';
import 'package:lab01_counter_app/pages/page_detail.dart';
import 'package:lab01_counter_app/pages/page_preference.dart';
import 'package:lab01_counter_app/utils/database_helper.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  DatabaseHelper databaseHelper = DatabaseHelper.instance;
  final Logger logger = Logger();

  _MyHomePageState() {
    logger.d('mounted variable is $mounted!');
  }

  double _counter = 0.0;
  String _userName = '';
  String messageResult = "Presiona algún botón para jugar";
  String defaultIcon = 'assets/icons/icon_game.svg';
  String winIcon = 'assets/icons/icon_win.svg';
  String defeatIcon = 'assets/icons/icon_defeat.svg';
  String icon = 'assets/icons/icon_game.svg';

  int _selectedIndex = 0;

  Future<void> _loadPreferences() async {
    final preferences = await SharedPreferences.getInstance();

    setState(() {
      _userName = preferences.getString('userName') ?? '';
      _counter = preferences.getDouble('counter') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    logger.d('Home page was already included in tree using init State method!');
    _loadPreferences();
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
  Widget build(BuildContext context) {
    logger.d("Home page build method was overrided and now mounted is $mounted!");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green
              ),
              child: Text(
                'Navegación'
              )
            ),
            ListTile( // Counter page.
              title: const Text('Contador'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                databaseHelper.insert(Audit(id: 0, action: 'Se abrió el drawer (Pagina principal)'));
                databaseHelper.insert(Audit(id: 0, action: 'Se seleccionó la opción Contador (Página principal > Drawer)'));
                Navigator.pop(context);
              },
            ),
            ListTile( // Detail page.
              title: const Text('Detalle'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                databaseHelper.insert(Audit(id: 0, action: 'Se abrió el drawer (Pagina principal)'));
                databaseHelper.insert(Audit(id: 0, action: 'Se seleccionó la opción Detalle (Página principal > Drawer)'));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPage())
                );
              },
            ),
            ListTile( // About page.
              title: const Text('Sobre'),
              selected: _selectedIndex == 2,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                databaseHelper.insert(Audit(id: 0, action: 'Se abrió el drawer (Pagina principal)'));
                databaseHelper.insert(Audit(id: 0, action: 'Se seleccionó la opción Sobre (Página principal > Drawer)'));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage())
                );
              },
            ),
            ListTile( // Audit page.
              title: const Text('Auditoría'),
              selected: _selectedIndex == 3,
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                databaseHelper.insert(Audit(id: 0, action: 'Se abrió el drawer (Pagina principal)'));
                databaseHelper.insert(Audit(id: 0, action: 'Se seleccionó la opción Auditoría (Página principal > Drawer)'));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AuditPage(title: 'Auditoría'))
                );
              },
            ),
            ListTile( // Preference page.
              title: const Text('Preferencia'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                databaseHelper.insert(Audit(id: 0, action: 'Se abrió el drawer (Pagina principal)'));
                databaseHelper.insert(Audit(id: 0, action: 'Se seleccionó la opción Preferencia (Página principal > Drawer)'));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PreferencePage(title: 'Preferencia'))
                ).then((_) {
                  _loadPreferences();
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Card(
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
              Text(
                _userName != '' ?
                  'Hola $_userName' :
                  'Hola, puedes modificar tu nombre de usuario en la pantalla Preferencia'
              ),
              Text
              (
                '${_counter.round()}',
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
                  ElevatedButton(
                    onPressed: context.read<AppData>().decrementCounter,
                    child: Icon(Icons.remove)
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: context.read<AppData>().resetCounter,
                    child: Icon(Icons.refresh)
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: context.read<AppData>().incrementCounter,
                    child: Icon(Icons.add)
                  ),
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
    );
  }
}

class ChildCounterWidget extends StatefulWidget {
  const ChildCounterWidget({super.key, required this.counter});
  final double counter;

  @override
  State<StatefulWidget> createState() => _ChildCounterWidgetState(counter);
}

class _ChildCounterWidgetState extends State<ChildCounterWidget> {

  static double counter = 0;

  _ChildCounterWidgetState(double _counter) {
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
