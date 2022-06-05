import 'package:flutter/material.dart';



class StudentList extends StatefulWidget {
  @override
  StudentListState createState() => StudentListState();
}

class StudentListState extends State<StudentList> {
  
  
  List<String> items = [
    'aster',
    'selome abe',
    'selam truneh',
    'hiwot ayalew',
    'maste mebratu',
    'kebede nigatu',
    'meskrlu yaregal',
  ];
  List<String> subjects = [
    'english',
    'maths',
    'chemistry',
    'biology',
    'amharic',
    'physics',
    'civics'
  ];
  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: Text('Student List Page'),
        ),
        body: buildList(),drawer: Drawer(backgroundColor: Colors.cyan,
            child: Column(
          children: [Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [ CircleAvatar(backgroundImage: 
        NetworkImage('https://source.unsplash.com/random?sig')),
            Text('Absalat Demissie'),
            
       Text('Yididia School Teacher'),
          
            
            Text('abisdemisie@gmail.com'),
         
            
             Text('+251930961202',),
               
            
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.location_city),
               
                Text('Addis Ababa,Ethiopia')
              ],
            ),Column(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [Text('If you want to teach from home, let us handle it!'),
            Text('This is fully optional and up to you to decide to teach at your home.'),Text(' Add your address as specific as possible. But don’t worry, you will be safe!'),
            Text('We will not disclose your address to your student until you confirm the lesson request')],)],)
          
          
            
            ,
           
          ],
        )),

        
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'ChatRoom')
        ]),
      ));
  Widget buildList() => ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final subject = subjects[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage:
                NetworkImage('https://source.unsplash.com/random?sig=$index'),
          ),
          title: Text(item),
          subtitle: Text(subject),
        );

      });
}
