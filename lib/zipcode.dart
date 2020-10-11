import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location.dart';

class ZipCode extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ZipCode> {
  GoogleMapController mapController;
  bool _initialized = false;
  bool _error = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Enter Your ZipCode'),
          ),
          backgroundColor: Colors.green[700],
        ),
        body: Column(
          children: [
            Container(
              height: 20,
            ),
            Container(
              height: 325,
                width: 350,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                  target: LatLng(33.0198, -96.6989), zoom: 16),
                  )
              ),
            Row(
            children: [
              Container(
                width: 45,
              ),
              Container(
                height: 50,
                width: 140,
                child: TextField(
                  onSubmitted: (String str) {
                  },
                ),
              ),
              Container(
              height: 75.0,
              width: 200.0,
              padding: EdgeInsets.fromLTRB(50,20,50,20),
              child: RaisedButton(
                child: Text("Submit"),
                onPressed: () {
                  Navigator.pop(context);
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Location())
                  );*/
                },
              ),
            )
            ]
            )
          ]
          ),
      );
  }
}

