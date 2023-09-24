import 'package:sqflite/sqflite.dart';
import 'dart:async';
//mendukug pemrograman asinkron
import 'dart:io';
//bekerja pada file dan directory
import 'package:path_provider/path_provider.dart';
import 'package:sqlitedatabases/models/pemasukan.dart';
//pubspec.yml

//kelass Dbhelper
class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper!;
  }

  Future<Database> initDb() async {
    // untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'cashflow.db';

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  //buat tabel baru dengan nama pemasukan
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pemasukan (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tanggal DATETIME,
        nominal INTEGER,
        keterangan TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database!;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('pemasukan', orderBy: 'tanggal');
    return mapList;
  }

//create databases
  Future<int> insert(Pemasukan object) async {
    Database db = await this.database;
    int count = await db.insert('pemasukan', object.toMap());
    return count;
  }

//update databases
  Future<int> update(Pemasukan object) async {
    Database db = await this.database;
    int count = await db.update('pemasukan', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('pemasukan', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Pemasukan>> getPemasukanList() async {
    var pemasukanMapList = await select();
    int count = pemasukanMapList.length;
    List<Pemasukan> pemasukanList = <Pemasukan>[];
    for (int i = 0; i < count; i++) {
      pemasukanList.add(Pemasukan.fromMap(pemasukanMapList[i]));
    }
    return pemasukanList;
  }
}
