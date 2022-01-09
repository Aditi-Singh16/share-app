import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_app/models/user.dart';
import 'package:share_app/screens/authenticate/get-started.dart';
import 'package:share_app/screens/home/tab-bar.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyUser? user = Provider.of<MyUser>(context);
    print('logged user is ${user.id}');
    if(user.id==null){
      return GetStarted();
    }else{
      return TabBarDemo(user.id);
    }
  }
}
