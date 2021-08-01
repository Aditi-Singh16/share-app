class MyUser{
  final int? id;
  final String userName;
  final String? profilePic;


  MyUser({
    required this.userName,
    this.profilePic,
    this.id,
  });

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'user_name': userName,
      'profile_pic': profilePic
    };
  }
}
