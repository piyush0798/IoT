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
  final databaseReference =
      FirebaseDatabase.instance.reference;
  //final firestoreInstance = FirebaseFirestore.instance;
  //final FirebaseDatabase database = FirebaseDatabase.instance.reference; //Rather then just writing FirebaseDatabase(), get the instance.  
    

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: databaseReference.child("Data").onValue,
        builder: (context, snapshot) {
          if(snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data.snapshot.value != null){
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.clear_all,
                      color: Colors.white,
                      ),
                      Text("My Reading",
                      style: 
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.yellow),
                      ),
                      Icon(Icons.settings)
                  ],
                ), 
                ),
                
                SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Temperature",
                                        style: TextStyle(
                                            color: !value
                                                ? Colors.white
                                                : Colors.yellow,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      snapshot.data.snapshot.value["Tempreature"]
                                      .toString(),
                                        style: TextStyle(
                                            color: Colors.yellow, fontSize: 25)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                SizedBox(height: 50),
                Column(
                        children: [
                  //          ElevatedButton(
                  //   onPressed: () {
                  //     writeData();
                  //   },
                  //   child: Text('Save Data'),
                  // ),
                               
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("BPM",
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              snapshot.data.snapshot.value["BPM"]
                                      .toString(),
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.yellow),
                            ),
                          )
                        ],
                    )

                       
            ],
            );
        }else 
         return Container();
        
        }),
      
    );



    }

    Future<void> writeData() async {
      databaseReference.child("Data").set({
        "Tempreature": 0,
        "BPM": 0,
        "SPO2":100
        });
    }
}