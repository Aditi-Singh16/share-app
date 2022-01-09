import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_app/models/user.dart';
import 'package:share_app/services/sharedPreferences.dart';

class Receiver extends StatefulWidget {
  final senderId;
  const Receiver({Key? key, @required this.senderId}) : super(key: key);

  @override
  _ReceiverState createState() => _ReceiverState();
}

class _ReceiverState extends State<Receiver> {
  Stream<MyUser> senderInfo = Stream.empty();

  String generateRandomString(int len) {
    var r = Random();
    String randomString =
        String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
    return randomString;
  }

  connectSender(String senderId) async {
    String receiverId = await HelperFunctions().readUserIdPref();
    String receiverName = await HelperFunctions().readUserNamePref();
    String receiverDeviceId = await HelperFunctions().readDeviceIdPref();

    MyUser user = MyUser(
        id: receiverId, userName: receiverName, deviceId: receiverDeviceId);

    await FirebaseFirestore.instance
        .collection('users')
        .doc(senderId)
        .collection('connections')
        .doc(receiverId)
        .set(user.toMap());
  }

  Future<String> downloadFile(String url) async {
    String dir = '/sdcard/download/';
    String fileName = generateRandomString(5);
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      myUrl = url + '/' + fileName;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
      } else {
        filePath = 'Error code: ' + response.statusCode.toString();
      }
    } catch (ex) {
      filePath = 'Can not fetch url';
    }
    return filePath;
  }

  @override
  void initState() {
    connectSender(widget.senderId);

    senderInfo = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.senderId)
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
        stream: senderInfo,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('Scan the code to connect...');
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
      // if()
    );
  }
}

//TODO
//just get the photos or files from the id
