import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
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
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Enter Your ZipCode'),
          backgroundColor: Colors.green[700],
        ),
        body: SingleChildScrollView(
          child: Column(
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
              Column(
                  children: [
                Container(
                  height: 30,
                ),
                Container(
                    height: 50,
                    width: 200,
                    child: Form(
                      key: _formKey,
                      child: Row(
                        children: [
                        Container(
                        width: 200.0,
                        child:TextFormField(
                            keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(5),
                          ],
                          controller: textController,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Enter ZipCode Here'),
                          onChanged: _onChanged,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your ZipCode';
                            }
                            if (charLength < 5) {
                              return 'Please enter all 5 digits';
                            }
                            return null;
                          },

                        ),
                      ),
                        ],
                      ),
                    )
                ),
                    Container(
                      height: 30,
                    ),
                Container(
                height: 75.0,
                width: 200.0,
                padding: EdgeInsets.fromLTRB(50,20,50,20),
                child: RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pop(context);

                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Location())
                    );*/
                    }
                  },
                ),
              ),
              ]
              ),
            ]
            ),
        ),
      );
  }
}

textField() {

}

