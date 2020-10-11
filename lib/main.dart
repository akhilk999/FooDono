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
          backgroundColor: Colors.green[700],
          title: Center(
          child: Text("FooDono"),
        )
      ),
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.4,
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ZipCode())
                  );
                },
                child: Text("Food Banks"),
              ),
            )
          ],
        )
      ),
    );
  }
}
