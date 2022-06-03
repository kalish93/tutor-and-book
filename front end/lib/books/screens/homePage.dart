import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_list.dart';

class homePage extends StatefulWidget{
  @override
  homePageState createState() => homePageState();
  }



class homePageState extends State<homePage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Container(

color: Colors.white,
 child:Column(children: [Container(

   width:MediaQuery.of(context).size.width,
   height:450,


 decoration: const BoxDecoration(
     borderRadius: BorderRadius.only(

       bottomLeft: Radius.circular(100),
       bottomRight: Radius.circular(100),
     ),color: Colors.blue,
   ),
   child: Align(
     alignment: Alignment.center,child: Text("Tutor + Book" , style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
   ),

 ),Container(height:30),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [Card(
    child: InkWell(
      focusColor:
      Colors.blue,
      onTap: (){},
      splashColor: Colors.green,
      child: Center(
        child: Column(
          mainAxisSize:MainAxisSize.max ,
          children: [
            Icon(
                Icons.book,size:60.0
            ),Text("Books", style: const TextStyle(fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    ),
  ),Card(
    child: InkWell(
      onTap: (){},
      splashColor: Colors.green,
      child: Center(
        child: Column(
          mainAxisSize:MainAxisSize.max ,
          children: [
            Icon(
                Icons.search,size:60.0
            ),Text("Search Tutor", style: const TextStyle(fontWeight: FontWeight.bold)
            ),

          ],
        ),
      ),
    ),
  ),Card(
    child: InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>BooksList()));
      },
      splashColor: Colors.green,
      child: Center(
        child: Column(
          mainAxisSize:MainAxisSize.max ,
          children: [
            Icon(
                Icons.add_task,size:60.0
            ),Text("Tutor Dashboard", style: const TextStyle(fontWeight: FontWeight.bold)
            ),
          ],
        ),
      ),
    ),
  )
  ],
)
],
 )
  )
    );

  }

}