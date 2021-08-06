import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_app/screens/home/receiver.dart';
import 'package:share_app/screens/home/sender.dart';
import 'package:file_picker/file_picker.dart';

class GetFiles extends StatefulWidget {
  const GetFiles({ Key? key }) : super(key: key);

  @override
  _GetFilesState createState() => _GetFilesState();
}

class _GetFilesState extends State<GetFiles> {
  List<String> extensions = ['jpg','pdf'];
  Map<String, String> paths = {};
  List<io.File> files = [];

  void _openfilepicker() async {
     FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

      if(result != null) {
        files = result.paths.map((path) => io.File(path!)).toList();
        print(files);
      } else {
        // User canceled the picker
      }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
        body: Column(
          children: [
            ElevatedButton(
              child: Text('Choose files'),
              onPressed: _openfilepicker,
        ),
        files.length == 0 ?
        // ListView.builder(
        //   // Let the ListView know how many items it needs to build.
        //   itemCount: files.length,
        //   // Provide a builder function. This is where the magic happens.
        //   // Convert each item into a widget based on the type of item it is.
        //   itemBuilder: (context, index) {
        //     final item = files[index].path;

        //     return Text(item);
           
        //   },
        // )
        Text("Files not selected")
        : Text("files selected")
        

        ],)
  }
}
