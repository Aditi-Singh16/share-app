import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(color: Color(0xff68C7E4)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset('assets/getstarted.json'),
            ),
            SizedBox(height: 100.0),
            MaterialButton(
              height: 50.0,
              minWidth: 300.0,
              color: Color(0xff5E60CE),
              textColor: Colors.white,
              child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white

                          ),
                      ),
              onPressed: () => {},
              splashColor: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
