// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:lab01_counter_app/models/app_data.dart';
import 'package:logger/logger.dart';
import 'package:lab01_counter_app/pages/page_home.dart';
import 'package:provider/provider.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  // List<CameraDescription> cameras = List.empty(growable: true);
  // try {
  //   cameras = await availableCameras();
  // } catch (ex) {
  //   print('Exception');
  // }

  // Get a specific camera from the list of available cameras.
  // final firstCamera = cameras.first;

  runApp(const MyApp());
  // runApp(MyApp(firstCamera: cameras.first));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // CameraDescription firstCamera;
  // MyApp({super.key, required this.firstCamera});
  
  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working!");

    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData
        (
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          fontFamily: 'Oswald'
        ),
        home: MyHomePage(title: 'Aplicación Contador'),
        // home: MyHomePage(title: 'Aplicación Contador - Página Principal', camera: firstCamera,),
        // home: TakePictureScreen(camera: firstCamera),
      )
    );
  }
}
