import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'dart:convert';
import 'package:zipcode_screen/models/model.dart';
import 'confirm.dart';

class Consumer extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ConsumerState createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  GoogleMapController mapController;
  bool _initialized = false;
  bool _error = false;
  final fb = FirebaseDatabase.instance;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
              title: Text("FooDono",),
              backgroundColor: Colors.green[700],
            ),
            body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                    child: Text(
                    "Minnie's Food Pantry",
                  style: TextStyle(fontSize: 22),
                  ),
                 ),
                    Container(
                      height: 20,
                    ),
                Container(
                  child: Text(
                    "661 18th St",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                    Container(
                      height: 20,
                    ),
                Container(
                  child: Text(
                    "2020-8-14 to 2020-8-15 @ 2:00 PM to 5:00 PM",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                    Container(
                      height: 20,
                    ),
                    Container(
                        height: 325,
                        width: 350,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(33.024817, -96.706692), zoom: 16),
                        ),
                    ),
                    Container(
                      height: 20,
                    ),
                Container(
                  child: Text(
                    "Offers Food",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                    Container(
                      height: 23,
                    ),
                Container(
                  child: RaisedButton(
                      color: Colors.green[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Text('Confirm Timing',style: TextStyle(color: Colors.grey[200],)),
                      onPressed: () {
                        ref.child("foodbanks").once().then((DataSnapshot data) {
                          //print(data.value);
                          //List<FoodBanks> foodbanks = [];
                          //Map<String, dynamic> foodBanks = jsonDecode(data.value);
                          FoodBankList foodbanks =
                          FoodBankList.fromJson(data.value);
                          print(foodbanks.foodbanks[0].aaddress);

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
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Confirm()),
                        );
                      }),
                )
              ]),
            ));
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
