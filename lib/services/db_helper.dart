

import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ?? await datafetch();

  
  static Future<Database> datafetch () async{
    final db = await getDatabasesPath();
    final path = join(db, "hadith_db.db");
    final isExist = await databaseExists(path);
    if(!isExist){
      try{
      await Directory(dirname(path)).create(recursive: true);
      } catch (ex) {
       throw Exception(ex.toString());
      }
      final data = await rootBundle.load(join("assets","database","hadith_db.db"));
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(flush: true,bytes);
    } 
    return await openDatabase(path, version: 1);
  } 


  static Future<List<Map<String, dynamic>>> getData({required String tableName}) async {
    Database db = await datafetch();
    var tableData = await db.query(tableName);
    log(tableData.toString());
    return tableData;
  }
}
