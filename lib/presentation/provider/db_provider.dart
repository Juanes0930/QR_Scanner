import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qr_scanner_app/infraestructure/models/scan_model.dart';
export 'package:qr_scanner_app/infraestructure/models/scan_model.dart';

class DBProvider {
  static Database? _dataBase;
  static final DBProvider db = DBProvider._();
  DBProvider._();

 Future<Database?> get database async {
    if(_dataBase != null) return  _dataBase;
    _dataBase = await initDB();
    return _dataBase;

  }
  
  Future <Database> initDB() async {
    ///create path where the data will be stored 
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScanDB.db');

    print(path);

    ///Create Database
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version)async{
        await db.execute(
          '''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
          ''');
      },
      
    );

  }

 Future<int?> newScanRaw(ScanModel newScan)async {

      final id = newScan.id;
      final type = newScan.type;
      final value = newScan.value;
      ///verify database
      final db = await database;
      final response = await db?.rawInsert('''
       INSERT INTO Scans(id, type, value)
          VALUES($id ,'$type' , '$value')
''');
return response;
  }
  /// insert data 
  Future <int?>newScan(ScanModel newScan) async {
   final db = await database;
   final response = await db?.insert('Scans', newScan.toJson());
   
   ///this is id last insert register 
   return response;
  }

  ///Get data by id
  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }
   /// get all data from Database 
   Future<List<ScanModel?>> getAllScans(int id) async {
    final db = await database;
    final res = await db!.query('Scans');
    return res.map((item) => ScanModel.fromJson(item)).toList();
  }
  
  /// Get data by type 
  Future<List<ScanModel?>> getScanByType(String type) async {
    final db = await database;
    final res = await db!.rawQuery(
      '''
        SELECT * FROM Scans WHERE type = $type
      ''');
     return res.isNotEmpty 
     ? res.map((item) => ScanModel.fromJson(item)).toList()
     :[];
  } 

  /// Update data by id
  Future<int> updateScanById(ScanModel scanUpdate) async {
    final db = await database;
    final res = await db!.update(
       'Scans', scanUpdate.toJson(), 
       where: 'id = ?' , 
       whereArgs: [scanUpdate.id]);
    return res;
  }

  /// Delete data by id
  Future <int> deleteScanById (int id) async {
    final db = await database;
    final res = await db!.delete('Scans' , where: 'id = ? ' , whereArgs: [id]);
    return res;
  }


 ///Delete all scans 
  Future<int> deleteAllScan()async {
    final db = await database;
    final res = await db!.rawDelete(
      '''
      DELETE FROM Scans
      ''');
    return res;   
  }
}
