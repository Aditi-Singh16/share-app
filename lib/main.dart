import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:share_app/screens/authenticate/splash-screen.dart';
import 'package:share_app/wrapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home:Wrapper()
      home: SplashScreen(),
    );
  }
}









