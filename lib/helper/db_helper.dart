import 'dart:async';
import 'dart:io';

import 'package:my_app/booking/presenter_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static late DbHelper _dbHelper;
  static late Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    _dbHelper = DbHelper._createObject(); // Inisialisasi _dbHelper di sini
    _dbHelper.initDb(); // Initialize the database before returning the instance
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'petani.db'; // Ubah nama file database
    var petaniDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    _database = petaniDatabase; // Set the _database field
    return petaniDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Tanaman (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama_tanaman TEXT, -- Ubah nama kolom
      jenis_tanaman TEXT, -- Ubah nama kolom
      tanggal_menanam TEXT -- Ubah nama kolom
    )
  ''');
  }

  Future<Database> get database async {
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList =
        await db.query('tanaman', orderBy: 'nama_tanaman'); // Ubah nama tabel
    return mapList;
  }

  Future<int> insert(nanam object) async {
    Database db = await this.database;
    Map<String, dynamic> mapWithoutId = object.toMap();
    mapWithoutId.remove('id'); // Hapus kolom 'id' dari peta
    int count = await db.insert('tanaman', mapWithoutId);
    return count;
  }

  Future<int> update(nanam object) async {
    Database db = await this.database;
    int count = await db.update('tanaman', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db
        .delete('tanaman', where: 'id=?', whereArgs: [id]); // Ubah nama tabel
    return count;
  }

  Future<List<nanam>> getnanamList() async {
    var tanamanMapList = await select();
    int count = tanamanMapList.length;
    List<nanam> nanamList = []; // Ubah tipe objek
    for (int i = 0; i < count; i++) {
      nanamList.add(nanam.fromMap(tanamanMapList[i])); // Ubah tipe objek
    }
    return nanamList;
  }
}
