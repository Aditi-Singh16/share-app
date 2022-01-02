import 'package:flutter/material.dart';
import 'dart:io';


class GetFiles extends StatefulWidget {
  const GetFiles({ Key? key }) : super(key: key);

  @override
  _GetFilesState createState() => _GetFilesState();
}

class _GetFilesState extends State<GetFiles> {

  var files;
 




  

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
