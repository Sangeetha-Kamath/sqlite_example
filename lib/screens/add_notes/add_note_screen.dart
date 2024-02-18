import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sqlite/constants/string_constants.dart';
import 'package:flutter_sqlite/model/note.dart';
import 'package:flutter_sqlite/screens/add_notes/view_model/add_note_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addNoteProvider = ChangeNotifierProvider((ref)=>AddNoteProvider());
    TextEditingController  descController = TextEditingController();
    FocusNode txtFocusNode = FocusNode();

Future<void> addNotes(AddNoteProvider data)async{
  if(descController.text.isNotEmpty){
            int result =  await  data.onSubmitClicked(Note(description: descController.text),context);
            if(result.isFinite){
              Fluttertoast.showToast(msg: StringConstants.addNoteSuccess);
              descController.text="";
              
             
            }
              }else{
                Fluttertoast.showToast(msg: StringConstants.enterDescriptionError);
              }
          

}

    return Scaffold(
      appBar: AppBar(title: const Text(StringConstants.addNote),
      leading:  InkWell(
        onTap: (){
          Navigator.of(context).pop(true);
        },
        child: const Icon(Icons.arrow_back)),
      backgroundColor: Colors.lime,
      centerTitle: true,),
      body: Column(
        children: [
         
          Padding(padding: EdgeInsets.only(top:30.h,right:20.w,left:20.w),
      child: TextField(
        controller: descController,
        focusNode: txtFocusNode,
        showCursor: true,
        cursorColor: Colors.black,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 12
        ),
        decoration: InputDecoration(
          focusColor: Colors.black,
          enabledBorder: UnderlineInputBorder(borderRadius:BorderRadius.circular(12) ),
          focusedBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
          hintText: StringConstants.enterDescription,
          

        ),
        
        

      ),),
      Padding(padding: EdgeInsets.only(top:30.h),
      child:Consumer(
        builder: (context,ref,child) {
          final data = ref.watch(addNoteProvider) ;       
          return ElevatedButton(
            onPressed: (){
              addNotes(data);
              
            },
            
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lime,
              shape:  RoundedRectangleBorder(side:const  BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(12.r))
            ),
            child: const Text(StringConstants.submit,
            style: TextStyle(color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700),),);
        }
      )
      )
        ],
      ),



    );
  }
}