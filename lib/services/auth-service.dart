import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;


  //sign in anonymously
  Future singInAnon()async{
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      return user;
    }catch(e){
      print('error was ${e.toString()}');
      return null;
    }
  }
}