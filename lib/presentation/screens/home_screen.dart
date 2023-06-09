import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/presentation/provider/page_provider.dart';
import 'package:qr_scanner_app/presentation/provider/scan_list_provider.dart';
import 'package:qr_scanner_app/presentation/screens/directions_page.dart';
import 'package:qr_scanner_app/presentation/screens/maps_page.dart';
import 'package:qr_scanner_app/presentation/widgets/custom_floating_buttons.dart';
import 'package:qr_scanner_app/presentation/widgets/custom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:const Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Provider.of<ScanListProvider>(context , listen: false).deleteAllScans(); 

          }, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
     bottomNavigationBar:const CustomNavigationBar(),
     floatingActionButton:const CustomFloatingButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    
  }
}

class _HomePageBody extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final selectedPage = Provider.of<PageProvider>(context);
    final currentIndex = selectedPage.selectedPage;

    final scanListProvider = Provider.of<ScanListProvider>(context , listen: false);
   
    switch(currentIndex){
      case 0 :
        scanListProvider.loadScansByType('geo');
        return const MapsPage();
      case 1 :
        scanListProvider.loadScansByType('http');
        return const DirectionsPage();   
      default: 
          return const MapsPage();
    }
  }
}