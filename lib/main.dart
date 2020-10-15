import 'package:flutter/material.dart';
import 'zipcode.dart';
import 'producerinfo.dart';

void main() {
  runApp(MaterialApp(
      home: MainScreen()
  ));
}

class MainScreen extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('images/mainscreenicon.png', scale: 0.9),
              /*Text(
                  'FooDono',
                  style: TextStyle(
                      fontSize: 40,
                    color: Colors.white,
                      fontWeight: FontWeight.bold
                  )
              ),*/
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.4,
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.4,
                heightFactor: 0.3,
                child: RaisedButton(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ZipCode())
                    );
                  },
                  child: Text(
                      "Visitor",
                      style: TextStyle(fontSize: 20,color: Colors.green[800],)
                  ),
                ),
              )
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.55,
              ),
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.4,
                heightFactor: 0.3,
                child: RaisedButton(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Producer())
                    );
                  },
                  child: Text(
                      "Food Banks",
                      style: TextStyle(fontSize: 20,color: Colors.green[800])
                  ),
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
