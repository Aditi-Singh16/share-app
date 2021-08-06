import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_app/screens/home/receiver.dart';
import 'package:share_app/screens/home/sender.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

class GetFiles extends StatefulWidget {
  const GetFiles({ Key? key }) : super(key: key);

  @override
  _GetFilesState createState() => _GetFilesState();
}

class _GetFilesState extends State<GetFiles> {

  var files;
 
  void getFiles() async { //asyn function to get list of files
      List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
      var root = storageInfo[0].rootDir; //storageInfo[1] for SD card, geting the root directory
      var fm = FileManager(root: Directory(root)); //
      files = await fm.filesTree( 
      //set fm.dirsTree() for directory/folder tree list
        excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["pdf"] //optional, to filter files, remove to list all,
        //remove this if your are grabbing folder list
      );
      setState(() {}); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state. 
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD0EEF4),
      body:files == null? Text("Searching Files"):
           ListView.builder(  //if file/folder list is grabbed, then show here
              itemCount: files?.length ?? 0,
              itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xff00B4D8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      child:ListTile(
                         title: Text(
                             files[index].path.split('/').last.toString().replaceAll(".pdf", ""),
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white
                              ),
                         ),
                         leading: Icon(Icons.picture_as_pdf),
                      )
                    );
              },
          )

    );
  }
}
