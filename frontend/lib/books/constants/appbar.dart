import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar myAppBar(String title){
  return  AppBar(



    title:Text(title),
    toolbarHeight: 100,

    actions: [
      IconButton(onPressed: (){print("search");}, icon:Icon(Icons.search))
    ],
    flexibleSpace: Container(

    ),
    shape: RoundedRectangleBorder(

        borderRadius:  BorderRadius.only(

            bottomRight: Radius.circular(70),

            bottomLeft: Radius.circular(70))

    ),
    elevation: 14
    ,);
}