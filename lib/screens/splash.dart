import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:url_launcher/url_launcher.dart';
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
      image: new Image(image: AssetImage('assets/imgs/durae_logo.png')),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Color(loaderColor)
    );
  }
}


class AfterSplash extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(

          child: new Column(
            children: [
              Expanded(
                flex: 2,
                child: new Image(image: AssetImage('assets/imgs/durae_squared.png'), width: 80)
              ),
              Expanded(
                flex: 1,
                child: new Column(
                  children: [
                    const SizedBox(height: 10),
                    new OutlineButton(
                      splashColor: Colors.grey,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      highlightElevation: 0,
                      borderSide: BorderSide(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage("assets/imgs/google_logo.png"), height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    new Container(
                      width: 250,
                      child: new Column(
                        children: [
                          new Text("듀레는 YouTube 서비스를 사용하기 때문에\n 구글 계정으로만 가입이 가능합니다.", 
                            textAlign: TextAlign.center, 
                            style: TextStyle(fontSize: 11, color: Colors.grey, )
                          ),
                          const SizedBox(height: 20),
                          new GestureDetector(
                            onTap: _launchURL,
                            child: new Text("구글 계정 만들기.", 
                              textAlign: TextAlign.center, 
                              style: TextStyle(fontSize: 11, color: Colors.grey, )
                            ),
                          )
                          
                        ]
                    ))
                    ]
                ),
              )
              
            ]
          )
      ),
    );
  }
}
_launchURL() async {
  const url = 'https://accounts.google.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}