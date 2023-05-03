import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});


  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus_outlined),
      onPressed: () async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF', 
          'Cancel', 
           false, 
           ScanMode.QR);
           print(barcodeScanRes);
      }
      
      );
  }
}