import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(33.0198, -96.6989);

  void _onMapCreated(GoogleMapController controller) {
    mapController= controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Enter Your ZipCode'),
          ),
          backgroundColor: Colors.green[700],
        ),
        body: Container(
          alignment: Alignment(0.0, -0.7),
          child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.6,
              child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  )
              )
          ),
        ),
      ),
    );
  }
}
