import 'package:flutter/material.dart';
import 'package:flutter_sqlite/model/note.dart';
import 'package:flutter_sqlite/service/sqlite_service.dart';

class NotesProvider with ChangeNotifier{
 final SqliteService _sqliteService = SqliteService();



Future<List<Note>> fetchNotes() async{
  notifyListeners();
 return _sqliteService.getItems();

}


}