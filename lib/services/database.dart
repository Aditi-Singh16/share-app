import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:share_app/services/sharedPreferences.dart';

class DatabaseService{

  FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadPhotos(String path)async{
    File file = File(path);
    Reference ref = storage.ref().child(await HelperFunctions().readUserIdPref() +"-"+ DateTime.now().toString());
    try {
      await ref.putFile(file);
    }  catch (e) {
      print("error is "+e.toString());
    }
  }


}