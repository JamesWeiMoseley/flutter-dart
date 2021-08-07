import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:new_journal/model/journal_model.dart';
import 'dart:async';

//this class is my database manager
class JournalDB {
  JournalDB._privateConstructor();
  static final JournalDB instance = JournalDB._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

//initalize and opens the dateabase
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'journal.sqlite3.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

//creates a database
  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE IF NOT EXISTS journal_entries
        (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, 
        rating INTEGER NOT NULL, date TEXT NOT NULL);''');
  }

  //the get entries function will get the data from the databae in a list
  Future<List<Entry>> getEntries() async {
    Database db = await instance.database;
    var journal_entries = await db.query('journal_entries', orderBy: 'title');
    List<Entry> entryList = journal_entries.isNotEmpty
        ? journal_entries.map((c) => Entry.fromMap(c)).toList()
        : [];
    return entryList;
  }

  //add functino will insert to database
  Future<int> add(Entry entry) async {
    Database db = await instance.database;
    return await db.insert('journal_entries', entry.toMap());
  }
}
