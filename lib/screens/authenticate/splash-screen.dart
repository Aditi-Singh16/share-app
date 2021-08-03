import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_app/screens/authenticate/get-started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState(){
    Future.delayed(Duration(seconds:5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>GetStarted()));
    });
    super.initState();
  }
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset('assets/splash.json'),
            )
          ],
        ),
      ),
    );
  }
}
