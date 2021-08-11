import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:share_app/models/user.dart';
import 'package:share_app/screens/authenticate/splash-screen.dart';
import 'package:share_app/services/auth-service.dart';
import 'package:share_app/services/dataBase_Helper.dart';
import 'package:share_app/wrapper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dbHelper = DataBaseHelper.instance;
  bool isLoggedIn = false;

  Future checkIfLoggedIn()async{
    List<MyUser> allUsers= await dbHelper.getAllUsers();
    if(allUsers.length>=1){
      setState(() {
        isLoggedIn=true;
      });
    }
  }

  @override
  void initState(){
    checkIfLoggedIn();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(isLoggedIn),
    );
  }
}










