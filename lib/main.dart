
import 'package:flutter/material.dart';
import 'package:qr_scanner_app/infraestructura/screens/home_screen.dart';
import 'package:qr_scanner_app/infraestructura/screens/maps_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomeScreen(),
        'mapa':(context) => const MapsScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          
        ),
        body: const Center(
          child: Text('Hello World'),
          
        ),
      ),
    );
  }
}
