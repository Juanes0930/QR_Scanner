import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
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
      const barcodeScanRes = 'https://juanescode.com';
      final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

      scanListProvider.newScan(barcodeScanRes);
      scanListProvider.newScan('geo:23.43.56.22');
      }
      
      );
  }
}