import 'package:flutter/material.dart';
import 'main.dart';

class Confirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("FooDono"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            height: 75.0,
            width: 350.0,
            padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Text(
              "You are confirmed",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 75.0,
            width: 350.0,
            padding: EdgeInsets.fromLTRB(25, 25, 20, 10),
            child: Text(
              "When do you want to be notified?",
              style: TextStyle(fontSize: 20),
            ),
          ),
          /*
          Container(
            margin: EdgeInsets.all(20.0),
            color: Colors.green,
            height: 75.0,
            width: 350.0,
            padding: EdgeInsets.fromLTRB(25, 25, 20, 10),
            child: MyStatefulWidget(),
          ), */
          Container(
            margin: EdgeInsets.all(20.0),
            height: 75.0,
            width: 350.0,
            padding: EdgeInsets.fromLTRB(25, 25, 20, 10),
            child: RaisedButton(
              color: Colors.green[700],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),);
              },
              child: Text("Confirm",style: TextStyle(color: Colors.grey[200],)),
            ),
          )
        ],
      ),
    );
  }
}