import 'package:flutter/material.dart';
import 'package:share_app/screens/home/get-files.dart';
import 'package:share_app/screens/home/get-music.dart';
import 'package:share_app/screens/home/get-photos.dart';
import 'package:share_app/screens/home/get-videos.dart';
import 'package:share_app/screens/home/receiver.dart';
import 'package:share_app/screens/home/sender.dart';
import 'package:share_app/services/database.dart';
import 'package:share_app/services/sharedPreferences.dart';
import '../../make-responsive.dart';


class TabBarDemo extends StatefulWidget {
  final id ;
  TabBarDemo(this.id);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  String userName = '';

  DatabaseService _databaseService = new DatabaseService();
  Future getName()async{
    String name = await HelperFunctions().readUserNamePref();
    setState(() {
      userName= name;
    });
  }
  @override
  void initState(){
    print('user id is ${widget.id}');
    getName();
    super.initState();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xffCAF0F8),
          appBar: AppBar(
            bottom:TabBar(
              tabs: [
                Tab(icon: Icon(Icons.image)),
                Tab(icon: Icon(Icons.video_library_rounded)),
                Tab(icon: Icon(Icons.folder)),
                Tab(icon: Icon(Icons.music_note)),
              ],
            ),
            title: Text('$userName'),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GetPhotos(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GetVideos(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:  GetFiles(),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:  GetMusic(),
                    )
                  ],
                ),
              ),
              Container(
                height: SizeConfig.blockSizeVertical!*20,
                child: Stack(
                  children: [
                    Positioned(
                        top: SizeConfig.blockSizeVertical!*2,
                        left: SizeConfig.blockSizeHorizontal!*10,
                        child:ElevatedButton(
                          child: Icon(
                              Icons.folder_open,
                            color: Color(0xff023E8A),
                            size: 50,
                          ),
                          onPressed: () {
                            HelperFunctions().readUploadList().then((value) => {
                              value.forEach((element)async {
                                await _databaseService.uploadPhotos(element);
                              })
                            });
                            Navigator.push(context,MaterialPageRoute(
                              builder: (BuildContext context) => SenderScreen('sender'),
                            ));
                          },
                            style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0)
                            ),
                            padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                            primary: Color(0xff64DFDF),
                            elevation: 10.0,
                            )
                        )
                    ),
                    Positioned(
                        top: SizeConfig.blockSizeVertical!*1,
                        left: SizeConfig.blockSizeHorizontal!*20,
                        child:Icon(
                            Icons.arrow_upward,
                          color: Color(0xff023E8A),
                          size: 50,
                        )
                    ),
                    Positioned(
                        top: SizeConfig.blockSizeVertical!*11,
                        left: SizeConfig.blockSizeHorizontal!*16,
                        child:Text(
                          'Send',
                          style: TextStyle(
                              color: Color(0xff5E60CE),
                              fontSize: 30,
                              fontFamily: 'Rancho'
                          ),
                        )
                    ),
                    Positioned(
                        top: SizeConfig.blockSizeVertical!*2,
                        right: SizeConfig.blockSizeHorizontal!*10,
                        child:ElevatedButton(
                            child: Icon(
                              Icons.folder_open,
                              color: Color(0xff023E8A),
                              size: 50,
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => ReceiverScreen('receiver'),
                              )
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(50.0)
                              ),
                              padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                              primary: Color(0xff64DFDF),
                              elevation: 10.0,
                            )
                        )
                    ),
                    Positioned(
                        top: SizeConfig.blockSizeVertical!*1,
                        right: SizeConfig.blockSizeHorizontal!*14,
                        child:Icon(
                          Icons.arrow_downward,
                          color: Color(0xff023E8A),
                          size: 50,
                        )
                    ),
                    Positioned(
                        top: SizeConfig.blockSizeVertical!*11,
                        right: SizeConfig.blockSizeHorizontal!*13,
                        child:Text(
                          'Receive',
                          style: TextStyle(
                              color: Color(0xff5E60CE),
                              fontSize: 30,
                              fontFamily: 'Rancho'
                          ),
                        )
                    )

                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
