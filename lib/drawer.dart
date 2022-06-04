import 'dart:convert';

import 'package:fluproject/search/profile.dart';
import 'package:flutter/material.dart';

class PersonalDrawer extends StatelessWidget {
  const PersonalDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            
            accountName: Text("parent1"),
            accountEmail: Text("email"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:Image.network(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                width:90,
                height:90,
                fit:BoxFit.cover
                )
              )
                
              ),
              
            ),
        ListTile(
          leading:Icon(Icons.logout),
          title:Text('log out'),
          onTap: () =>null,
        ),
        ],
      ),

    );
  }
}
