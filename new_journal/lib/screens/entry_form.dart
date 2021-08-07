import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_journal/db/journal_db.dart';
import 'dart:async';

import 'package:new_journal/model/journal_model.dart';

class EntryForm extends StatefulWidget {
  const EntryForm({
    Key? key,
  }) : super(key: key);

  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _body = '';
  DateTime now = DateTime.now();

  List<int> ratings = [1, 2, 3, 4];
  int rating = 1;

  final textController = TextEditingController();
  _submit() async {
    now = DateTime.now();
    String date = DateFormat('EEEE MMMM d, y - kk:mm').format(now);
    //it is chekcing for validatition for null fields here
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_title, $_body, $rating, $date');
      //here i am adding all the variables to the database
      await JournalDB.instance
          .add(Entry(title: _title, body: _body, rating: rating, date: date));
      setState(() {
        textController.clear();
      });
    } else
      print("you messed up");

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Entry"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //pretty much a form that saves each variables 'onSaved'
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
                      // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                      child: TextFormField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onSaved: (input) => _title = input!,
                        initialValue: _title,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a title';
                          } else {
                            return null;
                          }
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(28, 8, 28, 8),
                      child: TextFormField(
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                            labelText: 'body',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onSaved: (input) => _body = input!,
                        initialValue: _body,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a body';
                          } else {
                            return null;
                          }
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(28, 8, 28, 0),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            labelText: 'Rating',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        isExpanded: true,
                        value: rating,
                        items: ratings
                            .map((item) => DropdownMenuItem(
                                child: Text(
                                  item.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                value: item))
                            .toList(),
                        onChanged: (value) => setState(() {
                          rating = int.parse(value.toString());
                        }),
                      )),
                  //Here is the add button who's onPressed is submit
                  Container(
                      margin: EdgeInsets.fromLTRB(28, 8, 28, 8),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: _submit,
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
