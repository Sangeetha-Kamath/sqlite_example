

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sqlite/constants/string_constants.dart';
import 'package:flutter_sqlite/screens/add_notes/add_note_screen.dart';
import 'package:flutter_sqlite/screens/home/component/home_component.dart';
import 'package:flutter_sqlite/screens/home/view_model/notes_view_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = ChangeNotifierProvider((ref) => NotesProvider());
    
    return SafeArea(
      child: Consumer(
        builder: (context, ref, child) {
        final  notes = ref.watch(noteProvider);
          return Scaffold(
            
            
            appBar: AppBar(title:const  Text(StringConstants.home,
            ),
            centerTitle: true,
            backgroundColor: Colors.lime
            
            ),
            body:  FutureBuilder(
                  future: notes.fetchNotes() ,
                  builder: (context, snapshot) {
                    if(snapshot.hasData &&snapshot.data!=null){
                      return Padding(
                        padding:  EdgeInsets.only(bottom:20.h),
                        child: ListView.
                        builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: ((context, index) {
                          return HomeComponent(title: snapshot.data?[index].id.toString()??"",
                          description: snapshot.data?[index].description.toString()??"",);
                          
                        })),
                      );
                      
                    }
                  else if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator(),);
                  }else if(snapshot.hasError){
                   return const Center(child: Text(StringConstants.somethingWentWrong),);
                  }else{
                    return const Center(child: Text(StringConstants.noData),);
                  }
                },),
            
        
            floatingActionButton: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        side: const BorderSide(color: Colors.black)
                        ),
                    fixedSize: Size(100.w, 40.h),
                  ),
                  onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddNoteScreen())
                   ).then((value){
                    notes.fetchNotes();
                   });
                  },
                  child: Center(
                    child: Text(
                      StringConstants.addNote,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ))
          );
        }
      ),
    );
  }
}