import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_app/helpers/utils.dart';
import 'package:qr_scanner_app/presentation/provider/scan_list_provider.dart';


class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus_outlined),
      onPressed: () async{
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(#3D8BEF', 'Cancel', false, ScanMode.QR);
       //const barcodeScanRes = 'https://spotify.com';
        const barcodeScanRes = 'geo:6.308680, -75.573689';
        if(barcodeScanRes == '-1'){
          return;
        }

      final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

       final newScan = await scanListProvider.newScan(barcodeScanRes);   
      //scanListProvider.newScan(barcodeScanRes);

      launchURL(context, newScan);
      }
      
      );
  }
}