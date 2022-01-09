import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_app/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static String? otp;
  static final DataBaseHelper instance = DataBaseHelper._init(); //making obj
  static Database? _database;

  DataBaseHelper._init();

  //returns our database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('shareApp.db');
    return _database!;
  }

  _initDB(String _dbName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: 1, onCreate: createTable);
  }



  Future createTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS users(
      id VARCHAR(100) PRIMARY KEY,
      user_name TEXT NOT NULL,
      deviceId VARCHAR(100) NOT NULL,
      profilePic VARCHAR(60)
      )
      '''
    );
  }

  Future<int> insertUser(MyUser user) async {
    Database db = await instance.database;
    createTable(db,1);

    print('db is: $db');
    return await db.insert(
      'users',
      user.toMap(),
    );
  }

  //get all users
  Future<List<MyUser>> getAllUsers() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return MyUser(
        id: maps[i]['id'],
        userName: maps[i]['userName'],
        profilePic: maps[i]['profilePic']
      );
    });
  }

  Future<List<MyUser>> getUsersById(String id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM users WHERE id=$id');

    return List.generate(maps.length, (i) {
      return MyUser(
          id: maps[i]['id'],
          userName: maps[i]['userName'],
          profilePic: maps[i]['profilePic']
      );
    });
  }
}