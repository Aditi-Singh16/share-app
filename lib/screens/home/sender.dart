import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:share_app/models/user.dart';

class Sender extends StatefulWidget {
  final myId;
  const Sender({Key? key,@required this.myId}) : super(key: key);

  @override
  _SenderState createState() => _SenderState();
}

class _SenderState extends State<Sender> {
  Stream<MyUser> receiverInfo = Stream.empty();

  @override
  void initState() {
    receiverInfo = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.myId)
        .collection('connections')
        .doc()
        .snapshots()
        .map((event) {
      return MyUser(
          userName: event.data()!['user_name'],
          id: event.data()!['id'],
          deviceId: event.data()!['deviceId']);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<MyUser>(
        stream: receiverInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Tell the receiver to scan this code to connect...');
            case ConnectionState.waiting:
              return Text('Awaiting...');
            case ConnectionState.active:
              return ListTile(
                title: Text('${snapshot.data!.userName}'),
              );
            case ConnectionState.done:
              return Text('done');
          }
        },
      ),
    );
  }
}
