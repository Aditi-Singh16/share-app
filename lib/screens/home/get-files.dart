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

  void _openfilepicker() async {
     // User canceled the picker
  }

  

  @override
  Widget build(BuildContext context) {
    return Center(
 
        child: ElevatedButton(
         
          child: Text('Choose files'),
          onPressed: (){},
        )

    
      
       
      
    );
  }
}
