

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sqlite/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteService{
  Future<Database> initializeDB()async{
    String path = await getDatabasesPath();
    return openDatabase(join(path,'database.db'),
    version: 1,
    onCreate: (db, version) async{
      await db.execute("CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)");
    },);
    
  }

  Future<int> createItem(Note note) async{
   
    final Database db = await initializeDB();
    final result = await db.insert('Notes', note.toMap(),
    conflictAlgorithm:ConflictAlgorithm.replace);
   
    return result;
  }

  Future<List<Note>> getItems()async{
  final  db = await SqliteService().initializeDB();
  final List<Map<String, dynamic>> items =  await db.query('Notes');
  List<Note> notes =  items.map((e)=>Note.fromMap(e)).toList();
  log("notes:$notes");
  return notes;


}

Future<void> deleteItem(String id) async{
  final  db = await SqliteService().initializeDB();
  try{
await db.delete('Notes', where: "id= ?",whereArgs: [id]);
  }catch(e){
    debugPrint("Something went wrong");
  }
  


}


}

