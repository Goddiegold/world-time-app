import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/loading.dart';
import 'screens/choose_location.dart';

void main() {
  runApp(MaterialApp(
      // home: Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation()
      }));
}

//maps in dart

// Map student = {'name':'chun-li','age':25};
// print(student['name']);



// widget lifecycle

// stateless widget
// state doesn't change over time
// build function only once


// stateful widget
// state cna change over time
// setState() triggers the build function

// lifecycle methods

// initState()
// called only once when the widget is created
// subscribe to streams or any object that could change our widget data

// build()
// builds the widget three
// a build is triggered every we use setState

// dispose()
// when the widget / state object is removed