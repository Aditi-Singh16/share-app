import 'package:shared_preferences/shared_preferences.dart';


class HelperFunctions{

  final idKey = 'this_user_id';
  final userNameKey = 'this_user_fName';
  final uploadListKey = 'this_upload_list';

  Future<void> setUserIdPref(String? id) async {
    final prefs = await SharedPreferences.getInstance();

    if (id == null) {
      prefs.setString(idKey, '0');
    }
    prefs.setString(idKey, id!);
  }

  Future<void> setUserNamePref(String? userName) async {
    final prefs = await SharedPreferences.getInstance();

    if (userName == null) {
      prefs.setInt(idKey, 0);
    }
    prefs.setString(userNameKey, userName!);
  }

  Future<void> setUploadList(List<String> uploadList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(uploadListKey, uploadList);
  }

  Future<String> readUserIdPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('this_user_id') ?? '0';
  }

  Future<List<String>> readUploadList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('this_upload_list') ?? [];
  }

  Future<String> readUserNamePref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('this_user_fName') ?? '';
  }

}