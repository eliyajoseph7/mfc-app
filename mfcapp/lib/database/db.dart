// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MfcDb {
  static String db_name = 'mfc_db';
  static int version = 1;

  myDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, db_name);

    // await deleteDatabase(path);

    Database database = await openDatabase(path, version: version, onCreate: (Database db, version) async {
      await db.execute('CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, body TEXT, is_synced bool, user_id INTEGER)');
      await db.execute('CREATE TABLE teachings (id INTEGER PRIMARY KEY, title TEXT, body TEXT, is_synced bool, user_id INTEGER)');
    },);

  }
}