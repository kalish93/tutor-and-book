import 'package:flutter/material.dart';


class UpdatePage extends StatelessWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("update"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
                width: 1,
              ),
            ),
            child: Column(
              children: [
              CircleAvatar(
            radius: 28,
            backgroundImage:
                NetworkImage(
                  'https://source.unsplash.com/random?sig'),
          ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.grey,
                  child: IconButton(
                    icon: const Icon(Icons.edit),
                    //todo: change profile picture of the user
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //todo: put all the appropriate infomrmation of the user inside here
              Flexible(fit:FlexFit.tight,
                  child: Container(height: 200,width: 1000,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'subject',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Update"),
                        ),
                      ],
                    ),
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
