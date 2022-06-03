import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_network/books/books.dart';
// import 'package:test/books/books.dart';
import '../books.dart';
import '../bloc/books_bloc.dart';
import '../bloc/books_event.dart';
import '../models/book.dart';
import 'book_route.dart';
import 'book_list.dart';

// class AddUpdateBook extends StatefulWidget {
//   static const routeName = 'bookAddUpdate';
//   final BookArgument args;

//   AddUpdateBook({required this.args});
//   @override
//   _AddUpdateBookState createState() => _AddUpdateBookState();
// }

// class _AddUpdateBookState extends State<AddUpdateBook> {
//   final _formKey = GlobalKey<FormState>();

//   final Map<String, dynamic> _book = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${widget.args.edit ? "Edit Book" : "Add New Book"}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                   initialValue: widget.args.edit ? widget.args.book?.title : '',
//                   validator: (value) {
//                     if(value!=null){
//                     if (value.isEmpty) {
//                       return 'Please enter course code';
//                     }
//                     return null;
//                     }
//                   },
//                   decoration: InputDecoration(labelText: 'title'),
//                   onSaved: (value) {
//                     setState(() {
//                       this._book["title"] = value;
//                     });
//                   }),
//               TextFormField(
//                   initialValue:
//                       widget.args.edit ? widget.args.book?.author : '',
//                   validator: (value) {
//                     if(value!=null){
//                     if (value.isEmpty) {
//                       return 'Please enter author';
//                     }
//                     return null;}
//                   },
//                   decoration: InputDecoration(labelText: 'Edition '),
//                   onSaved: (value) {
//                     this._book["edition"] = value;
//                   }),
//               TextFormField(
//                   initialValue: widget.args.edit
//                       ? widget.args.book?.publication_year.toString()
//                       : '',
//                   validator: (value) {
//                     if(value!=null){
//                     if (value.isEmpty) {
//                       return 'Please enter publication year';
//                     }
//                     return null;
//                   }
//                   },
//                   decoration: InputDecoration(labelText: 'publication year'),
//                   onSaved: (value) {
//                     setState(() {
//                       this._book["publication_year"] = value;//int.parse(value);
//                     });
//                   }),
//               TextFormField(
//                   initialValue:
//                       widget.args.edit ? widget.args.book?.description : '',
//                   validator: (value) {
//                     if(value!=null){
//                     if (value.isEmpty) {
//                       return 'Please enter course description';
//                     }
//                     return null;}
//                   },
//                   decoration: InputDecoration(labelText: 'Course Description'),
//                   onSaved: (value) {
//                     setState(() {
//                       this._book["description"] = value;
//                     });
//                   }),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     final form = _formKey.currentState;
//                     if(form !=null){
//                     if (form.validate()) {
//                       form.save();
//                       final BookEvent event = widget.args.edit
//                           ? BookUpdate(
                              
//                               Book(
//                                 id: widget.args.book.id,
//                                 title: this._book["title"],
//                                 author: this._book["author"],
//                                 publication_year: this._book["publication_year"],
//                                 description: this._book["description"],
//                               ),
//                             )
//                           : BookCreate(
//                               Book(
//                                 id: this._book["id"],
//                                 title: this._book["title"],
//                                 author: this._book["author"],
//                                 publication_year: this._book["publication_year"],
//                                 description: this._book["description"],
//                               ),
//                             );
//                       BlocProvider.of<BookBloc>(context).add(event);
//                       Navigator.of(context).pushNamedAndRemoveUntil(
//                           BooksList.routeName, (route) => false);
//                     }
//                   }},
//                   label: Text('SAVE'),
//                   icon: Icon(Icons.save),
//                 ),
//               ),
//             ],
//           ),
//         ),

//       ),
//     );
//   }
// }

class AddUpdateBook extends StatefulWidget {
  static const routeName = 'courseAddUpdate';
  final BookArgument args;

  const AddUpdateBook({Key? key, required this.args}) : super(key: key);

  @override
  _AddUpdateBookState createState() => _AddUpdateBookState();
}

class _AddUpdateBookState extends State<AddUpdateBook> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _book = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Book" : "Add New Book"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book?.title : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter book title';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'book title'),
                  onSaved: (value) {
                    setState(() {
                      _book["title"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book?.author : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter book author';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'book author'),
                  onSaved: (value) {
                    _book["author"] = value;
                  }),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.book?.total_pages.toString()
                      : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter publication year';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'publication year'),
                  onSaved: (value) {
                    setState(() {
                      if (value != null) {
                        _book["total_pages"] = int.parse(value);
                      }
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.book?.description : '',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter book description';
                    }
                    return null;
                  },
                  decoration:
                      const InputDecoration(labelText: 'book Description'),
                  onSaved: (value) {
                    setState(() {
                      _book["description"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form != null && form.validate()) {
                      form.save();
                      final BookEvent event = widget.args.edit
                          ? BookUpdate(
                              widget.args.book?.id ?? 0,
                              Book(
                                id: widget.args.book?.id,
                                title: _book["title"],
                                author: _book["author"],
                                total_pages: _book["total_pages"],
                                description: _book["description"],
                              ),
                            )
                          : BookCreate(
                              Book(
                                id: null,
                                title: _book["title"],
                                author: _book["author"],
                                total_pages: _book["total_pages"],
                                description: _book["description"],
                              ),
                            );
                      BlocProvider.of<BookBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          BooksList.routeName, (route) => false);
                    }
                  },
                  label: const Text('SAVE'),
                  icon: const Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}