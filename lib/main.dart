import 'package:flutter/material.dart';
import 'zipcode.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("FooDono"),
        )
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ZipCode())
            );
          },
          child: Text("Visitor"),
        ),
      ),
    );
  }
}
