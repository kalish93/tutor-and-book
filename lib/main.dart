import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'drawer.dart';
import 'search/profile.dart';

// import 'homepage.dart';
// import 'home.dart';
void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List items = [
//     "1",
//         "1"
//         ,"1"
//         ,"1"
//         ,"1"
//         ,"1"
//         ,"1"
//         ,"1"
//         ,"1"
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Tutors "),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return profile();
//         },
//       ),
//     );
//   }

//   Widget profile() {
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: Card(
//         child: ListTile(
//             title: Row(
//           children: <Widget>[
//             Container(
//                 width: 50,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(25),
//                   image:DecorationImage(
//                     image:NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
//                   ),
//                 ),
//                 ),
//                 SizedBox(width:30),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                 Text("name  here" , style:TextStyle(fontSize: 15 , color: Colors.blue))
//                   ,
//                   SizedBox(height:5),
//                   Text("description here" , style:TextStyle(fontSize: 15 , color: Colors.blue))
//                   ,

//                   ],
//                 )
//           ],
//         )),
//       ),
//     );
//   }
// }
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Profile> _items = [
    Profile(
        'name',
        
    
        
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'subject1',
        false),
     Profile(
        'name',
        
    
        
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'subject2',
        false),
         Profile(
        'name',
        
    
        
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'subject3',
        false),
         Profile(
        'name',
        
    
        
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'subject',
        false),
         Profile(
        'name',
        
    
        
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'subject',
        false),
         Profile(
        'name',
        
    
        
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'subject',
        false),
         Profile(
        'name',
        
    
        
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'subject',
        false),
  ];
  List<Profile> _foundedUser = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _foundedUser = _items;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUser = _items
          .where((profile) => profile.Subject.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: PersonalDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue.shade100,
          title: Container(
            height: 30,
            child: TextField(
              onChanged: (value) => onSearch(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade100),
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(0),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'search tutor',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(right:20 , left:20),
            color: Colors.white30,
            child: _foundedUser.length > 0? ListView.builder(
                itemCount: _foundedUser.length,
                itemBuilder: ((context, index) {
                   return  tutorComponent(profile: _foundedUser[index]);
                })
                    )
                    :Center(child:Text("No tutor for this subject" , style: TextStyle(color:Colors.green))), 
                    ),
          bottomNavigationBar: GNav(
            backgroundColor: Colors.blue.shade200,
            tabs:const [
              GButton(
                iconSize: 55,
                icon: Icons.home,
                text: 'Home',),
              GButton(
                iconSize: 55,
                icon: Icons.book,
                text: 'Books',),
              GButton(
                iconSize: 55,
                icon: Icons.chat,
                text: 'Chat Room',),
            ],

          ),
                    );
  }

  tutorComponent({required Profile profile}) {
    return Container(
      padding: EdgeInsets.only(top:10 , bottom:10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(profile.Image)),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.Name,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text(
                    profile.Subject,
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  profile.IsATutor = !profile.IsATutor;
                },
              );
            },
            child: AnimatedContainer(
              height: 35,
              width: 110,
              duration: Duration(microseconds: 300),
              decoration: BoxDecoration(
                color: profile.IsATutor
                    ? Colors.blue.shade500
                    : Colors.blue.shade200,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: profile.IsATutor
                        ? Colors.transparent
                        : Colors.grey.shade300),
              ),
              child: Center(
                  child: Text(profile.IsATutor ? 'UnFollow' : 'Follow',
                      style: TextStyle(
                          color: profile.IsATutor
                              ? Colors.black87
                              : Colors.grey.shade700))),
            ),
          ),
        ],
      ),
    );
  }
}
