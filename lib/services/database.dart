import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('transfer');
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  addFile(String filename)async{
    await collectionReference.add({'url':filename,'messageType':0});
  }
}