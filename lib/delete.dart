import 'package:flutter/material.dart';
class DeleteList extends StatelessWidget {
  const DeleteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("students List"),
        ),
        body: Center(
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                //todo: make each individual cards to be clickable so that when it is clicked it goes to the profile view page of the individual
                Card(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
            radius: 28,
            backgroundImage:
                NetworkImage('https://source.unsplash.com/random?sig'),
          ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Name:"),
                          const SizedBox(width: 10),
                          Text("selome abera"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("subject:"),
                          const SizedBox(width: 10),
                          Text("biology"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //todo: delete the employee from the database and change the state of the application to a login page
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Delete student"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                     CircleAvatar(
            radius: 28,
            backgroundImage:
                NetworkImage('https://source.unsplash.com/random?sig'),
          ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Name:"),
                          const SizedBox(width: 10),
                          Text("hiwot abera"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("subject:"),
                          const SizedBox(width: 10),
                          Text("chemistry"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Delete student"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
