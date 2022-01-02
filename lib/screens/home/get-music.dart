import 'package:flutter/material.dart';

class GetMusic extends StatefulWidget {
  const GetMusic({ Key? key }) : super(key: key);

  @override
  _GetMusicState createState() => _GetMusicState();
}

class _GetMusicState extends State<GetMusic> {
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
                      child:ListTile(
                         title: Text(files[index].path.split('/').last),
                         leading: Icon(Icons.image),
                         trailing: Icon(Icons.delete, color: Colors.redAccent,),
                      )
                    );
              },
          )

    );
  }
}
