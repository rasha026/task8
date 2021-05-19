import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splash_screen_view/SplashScreenView.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      home: firstSplash(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class firstSplash extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),(){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (Contex)=>SecondSplash()));

    }


    );
    return Scaffold(
      body: Center(
        child:Image.asset('pic/5.png') ,

      ),
      backgroundColor: Colors.black,
    );
  }
}


class SecondSplash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return SplashScreenView(
    imageSrc: 'pic/5.png',
    imageSize: 300,
    backgroundColor: Colors.black,
      navigateRoute: myHome());
  }
}


class myHome extends StatefulWidget {

  @override
  _myHomeState createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  String text=' ';
  DateTime Date;
  TimeOfDay Time;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title: Text('Date and Time '),backgroundColor: Colors.cyan,  leading: Image.asset('pic/1.png'),),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                    margin: new EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),

                    child: Text('$text',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 18),),

                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: InkWell(

                    splashColor: Colors.teal,
                    child:Column(children: [
                      Text('Enter Date and Time',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15), ),

                      Icon(Icons.calendar_today),
                    ],),
                    onTap: () {
                    setState(() {
                      _showDateTimePicker();
                    });},
                  ),

                ),

                    ],
                  ),
      ),


    );
  }
  Future<void> _showDateTimePicker()async
  {
    final DateTime datePicked=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));

    if(datePicked!=null)
    {
      final TimeOfDay timePicked=await showTimePicker(context: context,initialTime: TimeOfDay(hour: TimeOfDay.now().hour,minute: TimeOfDay.now().minute));
      if(timePicked !=null)
      {
        setState(() {
          text="${ DateFormat("yyyy-MM-dd").format(datePicked)}  ${timePicked.format(context)}";


          final snackBar = SnackBar(
            content: Text('$text'),
            action: SnackBarAction(
              label: 'ok',
              onPressed: () {
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        });
      }
    }

  }
}





