import 'package:flutter/material.dart';
import 'package:share_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //although we don't provide an option to logout but if user does that we
    // will either show auth screen(get started stuff) or the home screen
    return Home();
  }
}
