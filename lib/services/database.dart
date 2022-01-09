import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:share_app/services/sharedPreferences.dart';

class DatabaseService{

  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadPhotos(String path)async{
    File file = File(path);
    firebase_storage.Reference ref = storage.ref().child(await HelperFunctions().readUserIdPref()).child( "img - "+ DateTime.now().toString());
    try {
      await ref.putFile(file);
    }  catch (e) {
      print("error is "+e.toString());
    }
  }

  Future<void> listExample(String id) async {
  firebase_storage.ListResult result =
      await firebase_storage.FirebaseStorage.instance.ref(id).listAll();

  result.items.forEach((firebase_storage.Reference ref) {
    print('Found file: $ref');
  });

  result.prefixes.forEach((firebase_storage.Reference ref) {
    print('Found directory: $ref');
  });
}


}
