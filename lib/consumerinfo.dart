import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'models/model.dart';
import 'confirm.dart';
//import 'package:geocoder/geocoder.dart';

class Consumer extends StatefulWidget {
  // This widget is the root of your application.
  final FoodBank bank;
  Consumer(this.bank);
  @override
  _ConsumerState createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  GoogleMapController mapController;
  bool _initialized = false;
  bool _error = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    //initializeFlutterFire();
    super.initState();
  }

/* void _onMapCreated(GoogleMapController controller) {
     = controller;
  }

  void _getLatandLong() async {
    // From a query
    final query = "1600 Amphiteatre Parkway, Mountain View";
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    print("${first.featureName} : ${first.coordinates}");
  }
*/
  @override
  Widget build(BuildContext context) {
    // Show a loader until FlutterFire is initialized

    var appt_daytime = widget.bank.adate + " @ " + widget.bank.atime;
    var lists;
    var address = widget.bank.aaddress + ",";

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "FooDono",
              ),
              backgroundColor: Colors.green[700],
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        widget.bank.aname,
                        style: TextStyle(fontSize: 20),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    ),
                    Container(
                      child: Text(
                        address,
                        style: TextStyle(fontSize: 20),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    ),
                    Container(
                      child: Text(
                        widget.bank.acity,
                        style: TextStyle(fontSize: 20),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    ),
                    Container(
                      child: Text(
                        appt_daytime,
                        style: TextStyle(fontSize: 20),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    ),
                    Container(
                      height: 325,
                      width: 350,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(33.024817, -96.706692), zoom: 16),
                      ),
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    ),
                    Container(
                      height: 75.0,
                      width: 350.0,
                      child: Text(
                        "Offers Food and Clothing",
                        style: TextStyle(fontSize: 15),
                      ),
                      padding: EdgeInsets.fromLTRB(90, 25, 60, 20),
                    ),
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
                            //  _getLatandLong();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Confirm()),
                            );
                          }),
                    )
                  ]),
            )));
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
