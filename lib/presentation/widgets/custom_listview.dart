import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/presentation/provider/scan_list_provider.dart';


class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context); 
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) =>  ListTile(
        leading:const Icon(Icons.compass_calibration, color: Colors.white,),
        title: Text(scans[i].value),
        subtitle: Text(scans[i].id.toString()),
         trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
         onTap: () => print(scans[i].id),
      ) );
  }
}