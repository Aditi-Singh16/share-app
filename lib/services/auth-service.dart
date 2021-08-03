import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_app/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //sign in anonymously
  Future singInAnon(String displayName)async{
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      //after anonymous signIn adding user to fire-store db
      MyUser row = MyUser(userName: displayName, id: user!.uid);
      FirebaseFirestore.instance.collection('users').doc(user.uid).set(row.toMap());
      return user;
    }catch(e){
      print('error was ${e.toString()}');
      return null;
    }
  }
}