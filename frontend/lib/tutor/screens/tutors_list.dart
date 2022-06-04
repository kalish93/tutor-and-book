import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';


class TutorList extends StatelessWidget {
  // static const routeName = '/';

  const TutorList({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {

    return Scaffold(



      appBar:AppBar(title: Text("Tutors list")),
      // drawer: myDrawer(),
      body: BlocBuilder<TutorBloc, TutorState>(
        builder: (_, state) {
          if (state is TutorOperationFailure) {
            return const Text('Could not do book operation');
          }

          if (state is TutorOperationSuccess) {
            final tutors = state.tutors;

            return ListView.builder(
              itemCount: tutors.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text(tutors.elementAt(idx).name),
                // subtitle: Text(books.elementAt(idx).author),
                // onTap: () => Navigator.of(context).pushNamed(
                //     BookDetail.routeName,
                //     arguments: books.elementAt(idx)),
              ),
            );
          }

          return Center (child:const CircularProgressIndicator());
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => Navigator.of(context).pushNamed(
      //     AddUpdateBook.routeName,
      //     arguments: BookArgument(edit: false),
      //   ),
      //   label:Text("Share book"),

      // ),
    );
  }
}