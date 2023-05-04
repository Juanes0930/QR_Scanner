import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/presentation/provider/page_provider.dart';
import 'package:qr_scanner_app/presentation/provider/db_provider.dart';
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
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever))
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
    final int currentIndex = selectedPage.selectedPage;
    final tempScan = ScanModel(value: 'http://google.com');  
    DBProvider.db.deleteAllScan().then(print);
    switch(currentIndex){
      case 0 :
          return const MapsPage();
      case 1 :
          return const DirectionsPage();   
      default: 
          return const MapsPage();
    }
  }
}