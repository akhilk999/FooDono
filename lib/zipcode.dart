import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;
  bool _initialized = false;
  bool _error = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController= controller;
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute())
                  );
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
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Go back"),
        ),
      ),
    );
  }
}

