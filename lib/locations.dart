import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'dart:convert';
import 'models/model.dart';
import 'consumerinfo.dart';
//import 'confirm.dart';

/*
void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Consumer(),
  ));
}
*/
class LocationList extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _Location createState() => _Location();
}

class _Location extends State<LocationList> {
  bool _initialized = false;
  bool _error = false;
  final fb = FirebaseDatabase.instance;

  FoodBankList foodbanks;
  List<FoodBank> banks = [];

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();

      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

/* void _onMapCreated(GoogleMapController controller) {
     = controller;
  }
*/
  @override
  Widget build(BuildContext context) {
    // Show a loader until FlutterFire is initialized
    /*
    if (!_initialized) {
      return Loading();
    }
*/
    final ref = fb.reference();
    var retrievedName;
    var lists;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "FooDono",
            ),
            backgroundColor: Colors.green[700],
          ),
          body: FutureBuilder(
              future: ref.child("foodbanks").once(),
              builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                if (snapshot.hasData) {
                  //lists.clear();
                  foodbanks = FoodBankList.fromJson(snapshot.data.value);
                  print(foodbanks.foodbanks);
                  banks.addAll(foodbanks.foodbanks);
                  return new ListView.builder(
                      shrinkWrap: true,
                      itemCount: banks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Consumer(banks[index])),
                              );
                            },
                            child: Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(" "),
                                    Text("Name:" + banks[index].aname,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    Text(
                                        "Address: " +
                                            banks[index].aaddress +
                                            "," +
                                            banks[index].acity,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    Text("Date: " + banks[index].adate,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    Text("Time:" + banks[index].atime,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ],
                                ),
                                color: Colors.green[400]));
                      });
                }
                return CircularProgressIndicator();
              })

          /*
                    Container(
                      height: 75.0,
                      width: 300.0,
                      padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: RaisedButton(
                          color: Colors.green[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text('Confirm Timing',
                              style: TextStyle(
                                color: Colors.grey[200],
                              )),
                          onPressed: () {
                            /*
                            ref
                                .child("foodbanks")
                                .once()
                                .then((DataSnapshot data) {
                              //print(data.value);
                              //List<FoodBanks> foodbanks = [];
                              //Map<String, dynamic> foodBanks = jsonDecode(data.value);
                              foodbanks = FoodBankList.fromJson(data.value);
                              print(foodbanks.foodbanks[0].aaddress);
                              banks.add(foodbanks.foodbanks[0]);
                              banks.add(foodbanks.foodbanks[1]);
                              banks.add(foodbanks.foodbanks[2]);

                              print(banks);
                              //print(values);
                              /*
                          foodbanks.forEach((key, values) {
                            print(values);
                            //foodbanks.add(FoodBanks.fromSnapshot(values));
                          });
                          print(foodbanks);
                          //print(data.key);
                          //     ref.child("Location4").set("Plano");
                          setState(() {
                            retrievedName = data.value;
                          }); */

                              /*
                          List jsonResponse = json.decode(data.value);
                          print(jsonResponse
                              .map((bank) => new FoodBanks.fromSnapshot(bank))
                              .toList()); */
                            }); */
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Consumer()),
                            );
                          }),
                    ), */
          ),
    );
    //);
/*
    FutureBuilder(
        future: ref.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            lists.clear();
            Map<dynamic, dynamic> values = snapshot.data.value;
            values.forEach((key, values) {
              lists.add(values);
            });
            return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name: " + lists[index]["name"]),
                        Text("Age: " + lists[index]["age"]),
                        Text("Type: " + lists[index]["type"]),
                      ],
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        }); */
  }
}

/*
/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['1', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}*/
