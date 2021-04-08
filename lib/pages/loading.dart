import 'package:flutter/material.dart';
import 'package:flutter_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Taipei', url: 'Asia/Taipei', flag: 'taipei.png');

    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.blue[300],
            size: 50,
          ),
        ),
      ),
    );
  }
}
