class MyUser{
  final String? id;
  final String? userName;
  final String? profilePic;


  MyUser({
   this.userName,
    this.profilePic,
    this.id,
  });

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'user_name': userName,
      'profilePic': profilePic
    };
  }
}
