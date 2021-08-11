import 'dart:async';
import 'package:share_app/models/user.dart';
import 'dataBase_Helper.dart';

class UsersBloc {
  UsersBloc() {
    getUsers();
  }
  final dbHelper = DataBaseHelper.instance;
  final _userController = StreamController<List<MyUser>>.broadcast();
  get users => _userController.stream;

  dispose() {
    _userController.close();
  }

  getUsers() async {
    _userController.sink.add(await dbHelper.getAllUsers());
  }
}