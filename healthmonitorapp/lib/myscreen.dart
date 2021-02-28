import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyScreen extends StatefulWidget {
  MyScreen({Key key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final databaseReference =
      FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Screen'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  createdata();
                },
                child: Text('Save Data'),
              ),
              ElevatedButton(
                onPressed: () {
                  getdata();
                },
                child: Text('Get Data'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createdata() {
    var set = databaseReference
        .child("flutterDevsTeam1")
        .set({
      'name': 'Deepak Nishad',
      'description': 'Team Lead'
    });
    print(set.toString());
  }

  void getdata() {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }
}
