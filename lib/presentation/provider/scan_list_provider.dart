import 'package:flutter/material.dart';
import 'package:qr_scanner_app/presentation/provider/db_provider.dart';

/// class that extends changeNotifier
class ScanListProvider extends ChangeNotifier {
  /// List type ScanModel empty
  List<ScanModel> scans = [];

  /// String with default value
  String selectedType = 'http';

  /// Method asynchronous receives a string
  newScan(String value) async {
    /// variable receives value on the model value
    final newScan = ScanModel(value: value);

    /// receives the value of the id register and is the stored in the newScan
    final id = await DBProvider.db.newScan(newScan);

    ///the ids are equal
    newScan.id = id;
     

     /// valid if selectedType is equals type of the newScan
      if(selectedType == newScan.type){
        /// are added the newScan
        scans.add(newScan);
        notifyListeners();
      } 
  }

  loadAllScans()async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  loadScansByType(String type) async{
   final scans = await DBProvider.db.getScanByType(type);
   this.scans = [...scans];
   selectedType = type;
   notifyListeners();
  }

  deleteAllScans()async {
    await DBProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  deleteScanById (int id) async {
    final scans = await DBProvider.db.deleteScanById(id);
    loadScansByType(selectedType);
  }
}
