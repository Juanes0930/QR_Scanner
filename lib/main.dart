
import 'package:flutter/material.dart';
import 'package:qr_scanner_app/config/theme/app_theme.dart';
import 'package:qr_scanner_app/presentation/screens/home_screen.dart';
import 'package:qr_scanner_app/presentation/screens/map_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme().themeData(),
      initialRoute: 'home',
      routes: {
        'home':(context) => const HomeScreen(),
        'map':(context) => const MapScreen(),
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
