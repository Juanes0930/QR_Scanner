import 'package:sqflite/sqflite.dart';

class BDProvider {
  static Database? _dataBase;
  static final BDProvider db = BDProvider._();
  BDProvider._();

 Future<Database?> get database async {
    if(_dataBase != null) return  _dataBase;
    _dataBase = await initDB();

  }
  
  Future <Database?> initDB() async {
    
  }
}