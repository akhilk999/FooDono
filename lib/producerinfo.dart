import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Producer(title: 'Flutter Demo Home Page'),
    );
  }
}


class Producer extends StatefulWidget {
  Producer({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ProducerState createState() => _ProducerState();
}


class _ProducerState extends State<Producer> {
  // This widget is the root of your application.
  DateTime _dateTime;

  final formKey = GlobalKey<FormState>();
  final textControl = TextEditingController();
  final textControl2 = TextEditingController();
  final textControl3 = TextEditingController();
  int charLength2 = 0;

  _onChanged(String value) {
    setState(() {
      charLength2 = value.length;
    });
  }
  var formatter = new DateFormat('yyyy-MM-dd');
  DateTime fromDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime toDate =
  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  Future<DateTime> selectDate(BuildContext context, DateTime _date) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      _date = picked;
    }
    return _date;
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('FooDono'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 30,
              ),
              Container(
                  child: Text(
                      "Enter Your Food Bank's Info",
                      style: TextStyle(fontSize: 25)
                  )
              ),
              Container(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      "Your Group's Name:",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: textControl,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: "Enter Group's Name Here"),
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your group's name";
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                          "Your Group's ZipCode:",
                          style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.right,
                      ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      controller: textControl2,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: "Enter Group's ZipCode Here"),
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your group's ZipCode";
                        }
                        if (charLength2 < 5) {
                          return 'Please enter all 5 digits';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 150,
                      child: Text(
                            "Your Group's Address:",
                            style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.right,
                        ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 200,
                    child: TextFormField(
                      controller: textControl3,
                      autocorrect: true,
                      decoration: InputDecoration(hintText: "Enter Group's Address Here"),
                      onChanged: _onChanged,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your group's address";
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      "Start Date:",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 75,
                    child: Text('${formatter.format(fromDate)}'),
                  ),
                    Container(
                      width: 50,
                      child: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          fromDate = await selectDate(context, fromDate);
                          setState(() {});
                        },
                      ),
                    ),
                  Container(
                    width: 75,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Text(
                      "End Date:",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Container(
                    width: 75,
                    child:Text('${formatter.format(toDate)}'),
                  ),
                  Container(
                    width: 50,
                    child:IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        toDate = await selectDate(context, toDate);
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    width: 75,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: Colors.green[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Text("Submit",style: TextStyle(color: Colors.grey[200],)),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        showAlertDialog(context);
                      }
                    },
                  ),
                  Container(
                    width: 50,
                  ),
                  RaisedButton(
                    color: Colors.green[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Text("Reset",style: TextStyle(color: Colors.grey[200],)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()));
                    },
                  ),
                ],
              )
            ],
          ),
        )
    )
    );
  }
}
showAlertDialog(BuildContext context) {
  Widget cancel = FlatButton(
    textColor: Colors.green[700],
    child: Text('CANCEL'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget cont = FlatButton(
    textColor: Colors.green[700],
    child: Text('ACCEPT'),
    onPressed: () {
      /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Confirm())
      );*/
    },
  );


  AlertDialog alert = AlertDialog(
    title: Text('Submit'),
    content: Text('Are you sure you want to submit to show to Visitors?'),
    actions: [
      cancel,
      cont,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
