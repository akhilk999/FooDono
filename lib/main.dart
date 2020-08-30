import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            title: Center(
              child: Text('FooDono'),
            ),
        ),
        body: Center(
          child: Text('Enter your ZipCode HI:'),
        ),
      ),
    ),
  );
}
