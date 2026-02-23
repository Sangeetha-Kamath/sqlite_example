import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeComponent extends StatelessWidget {
  final String title;
  final String description;
  const HomeComponent({super.key, required this.title,
  required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:80.h,
      alignment: Alignment.topLeft,
    margin: EdgeInsets.only(right:20.w,left:20.w,top:20.h),
    padding: const EdgeInsets.all(16),
     
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.black)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 12.spMin,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),),
         Text(description,
                 style: TextStyle(
          fontSize: 12.spMin,
          overflow: TextOverflow.ellipsis,
          
          
          fontWeight: FontWeight.w400,
          
          color: Colors.black
                 ),
                 softWrap: true,
                 maxLines: 2,
                 )
      ],),
    );
  }
}