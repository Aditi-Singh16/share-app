class MyUser{
  final String? id;
  final String? userName;
  final String? profilePic;
  final String? deviceId;


  MyUser({
   this.userName,
    this.profilePic,
    this.id,
    this.deviceId
  });

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'user_name': userName,
      'profilePic': profilePic,
      'deviceId':deviceId
    };
  }
}
