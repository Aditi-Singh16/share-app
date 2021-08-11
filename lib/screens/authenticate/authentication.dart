import 'package:flutter/material.dart';
import 'package:share_app/screens/authenticate/get-started.dart';
import 'package:share_app/screens/home/tab-bar.dart';

class Authentication extends StatefulWidget {
  final uid;
  Authentication(this.uid);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    if(widget.uid!=''){
      return TabBarDemo(widget.uid);
    }else{
      return GetStarted();
    }
  }
}
