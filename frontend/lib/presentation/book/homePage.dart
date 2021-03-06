import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'book_list.dart';
import 'package:go_router/go_router.dart';
class homePage extends StatefulWidget{
  @override
  homePageState createState() => homePageState();
  }



class homePageState extends State<homePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:SafeArea(child:Container(

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
     alignment: Alignment.center,
     child: Container(
       child: Column(
       children: [
      Text("Tutor + Book" , style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 50),),
      Text('\"A place where you can find best books and tutors\"')
 ]))),

 ),Container(height:30),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [Card(
    child: InkWell(
      focusColor:
      Colors.blue,
      onTap: (){
        context.go('/books');
      },
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
      onTap: (){
        context.go('/tutors');
      },
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
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>BooksList()));
      },
      splashColor: Colors.green,
      child: Center(
        child: Column(
          mainAxisSize:MainAxisSize.max ,
          children: [
            Icon(
                Icons.add_task,size:60.0
            ),Text("Dashboard", style: const TextStyle(fontWeight: FontWeight.bold)
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
    ));

  }

}