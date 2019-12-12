import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import "dart:math";

class Splash extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();

  
}



class _MyAppState extends State<Splash> {
  Timer timer;
  int loaderColor = 0xFFE34133;
  var list = [0xFFE34133,0xFFF3B605,0xFF32A350,0xFF4081EC];
  @protected
  Future<void> loaderColorChanger() async {
    final _random = new Random();
    var element = list[_random.nextInt(list.length)];
    setState(() => loaderColor = element);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => loaderColorChanger());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image(image: AssetImage('assets/imgs/durae_logo.png')),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Color(loaderColor)
    );
  }
}


class AfterSplash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new Text("ddmdgk In SplashScreen Package"),
      automaticallyImplyLeading: false
      ),
      body: new Center(
        child: new Text("Done!",
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0
        ),),

      ),
    );
  }
}