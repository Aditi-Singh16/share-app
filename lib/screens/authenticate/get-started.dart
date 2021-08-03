import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_app/services/auth-service.dart';
import '../../make-responsive.dart';

class GetStarted extends StatelessWidget {

  final TextEditingController _textEditingController = new TextEditingController();
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(color: Color(0xff68C7E4)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: SizeConfig.blockSizeHorizontal!*50.0,
              child: TextField(
                controller: _textEditingController,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.blue[900]
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal!*80.0,
              height: SizeConfig.blockSizeVertical!*40,
              child: Lottie.asset('assets/getstarted.json'),
            ),
            MaterialButton(
              height: SizeConfig.blockSizeVertical!*7.0,
              minWidth: SizeConfig.blockSizeHorizontal!*80.0,
              color: Color(0xff5E60CE),
              textColor: Colors.white,
              child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white

                          ),
                      ),
              onPressed: ()async{
                dynamic result = await _authService.singInAnon(_textEditingController.text);
                print('after login $result');
              },
              splashColor: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
