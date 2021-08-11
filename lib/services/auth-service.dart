import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:share_app/models/user.dart';


class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<MyUser>? get loggedUser{
    FirebaseAuth.instance.authStateChanges().map(
            (event) => _userFromFirebase(event!.uid)
    );
  }


  Future<MyUser> _userFromFirebase(String uid) async{

    dynamic user = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    print('in _userFromFireBase ${user.data()}');
    return MyUser(
      id: user.data()!['id'],
      userName: user.data()!['user_name'],
      profilePic: user.data()!['profile_pic']
    );

  }


  //sign in anonymously
  Future<MyUser?> singInAnon(String displayName)async{
    try{
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;
      MyUser row = MyUser(userName:displayName, id: user!.uid);
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set(row.toMap());
      return _userFromFirebase(user.uid);
    }catch(e){
      print('error was ${e.toString()}');
      return null;
    }
  }

  Future<String> getUserName(String uid)async{
    if(uid==''){
      return 'not logged in';
    }else{
      var firebaseUser =  FirebaseAuth.instance.currentUser;
      dynamic result = FirebaseFirestore.instance.collection('users').doc(firebaseUser!.uid).get();
      return result.data()!['user_name'];

    }
  }
}