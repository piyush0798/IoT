import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';


class IotScreen extends StatefulWidget {
  @override
  _IotScreenState createState() => _IotScreenState();
}

class _IotScreenState extends State<IotScreen> {
  @override
  bool value = false;
  final dbRef = FirebaseDatabase.instance.reference;
  //final firestoreInstance = FirebaseFirestore.instance;
  //final FirebaseDatabase database = FirebaseDatabase.instance.reference; //Rather then just writing FirebaseDatabase(), get the instance.  
    

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.clear_all,
                  color: Colors.white,
                  ),
                  Text("My Reading",
                  style: 
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.settings)
              ],
            ), 
            ),
            //SizedBox(height: 20),
            SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Temperature",
                                    style: TextStyle(
                                        color: !value
                                            ? Colors.white
                                            : Colors.yellow,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    snapshot.data.snapshot.value["Temperature:"]
                                            .toString() +
                                        "°C",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ],
                          ),
                        ],
                      ),
            SizedBox(height: 20),
            Column(
                    children: [
               
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Humidity",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "80%",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                )

          
        ],
        ),
      
    );


    Future<void> readData() async {
    dbRef.child("Data").once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }
    }
}