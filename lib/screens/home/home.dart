import 'package:flutter/material.dart';
import 'package:share_app/screens/home/receiver.dart';
import 'package:share_app/screens/home/sender.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShareApp'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text(
                  'sender',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (BuildContext context) => SenderScreen('sender'),
              ));

              },
            ),
          ElevatedButton(
            child: Text(
                'receiver',
                style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => ReceiverScreen('receiver'),
              )
              );
            },
          ),
        ],
      ),
    );
  }
}