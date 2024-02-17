import 'package:flutter/material.dart';
import 'package:flutter_sqlite/model/note.dart';
import 'package:flutter_sqlite/service/sqlite_service.dart';

class AddNoteProvider with ChangeNotifier{
  final _sqliteService = SqliteService();
 Future<int> onSubmitClicked(Note note, BuildContext context)async{
  
 int result =  await _sqliteService.createItem(note);
 return result;


  }
}