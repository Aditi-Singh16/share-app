class MyUser{
  final String id;
  final String userName;
  final String? profilePic;


  MyUser({
    required this.userName,
    this.profilePic,
    required this.id,
  });

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'user_name': userName,
      'profile_pic': profilePic
    };
  }
}
