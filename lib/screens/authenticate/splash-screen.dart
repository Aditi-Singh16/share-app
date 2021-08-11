import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_app/screens/authenticate/get-started.dart';
import 'package:share_app/screens/home/tab-bar.dart';
import 'package:share_app/services/sharedPreferences.dart';

class SplashScreen extends StatefulWidget {
  
  final isLoggedIn ;
  SplashScreen(this.isLoggedIn);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String userName='';
  String id='';

  Future getAllInfo()async{
    String name = await HelperFunctions().readUserNamePref();
    String uid = await HelperFunctions().readUserIdPref();
    setState(() {
      userName= name;
      id = uid;
    });
  }

  @override
  void initState(){
    getAllInfo();
    Future.delayed(Duration(seconds:5),(){
      widget.isLoggedIn?
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>TabBarDemo(id)))
      :
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=>GetStarted()));  
    });
    super.initState();
  }
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(104, 199, 228, 1.0) ,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset('assets/splash1.json',repeat: false),
            )
          ],
        ),
      ),
    );
  }
}
