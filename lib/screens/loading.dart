// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:word_time_app/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  // const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // 'https://jsonplaceholder.typicode.com/todos/1'
  // 'http://worldtimeapi.org/api/timezone/Africa/Lagos'

  String time = "loading";

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: "Berlin", flag: "german.jpg", url: "Africa/Lagos");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    print('init state was called G - 1');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitFadingCube(
        color: Colors.white,
        size: 80.0,
      )),
    );
  }
}
