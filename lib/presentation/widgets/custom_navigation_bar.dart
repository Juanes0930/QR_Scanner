import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/presentation/provider/page_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar
({super.key});

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);
    final int currentIndex = pageProvider.selectedPage ;
    return BottomNavigationBar(
      onTap: (int i) => pageProvider.selectedPage = i,
      currentIndex: currentIndex,
      elevation: 0,
      items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon:Icon(Icons.map),label: 'Map'),

         BottomNavigationBarItem(icon:Icon(Icons.compass_calibration),label: 'Directions'),
        ] 
    );
  }
}