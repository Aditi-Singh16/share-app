import 'package:flutter/material.dart';
import 'package:share_app/screens/home/get-files.dart';
import 'package:share_app/screens/home/get-music.dart';
import 'package:share_app/screens/home/get-photos.dart';
import 'package:share_app/screens/home/get-videos.dart';

import '../../make-responsive.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
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
            title: const Text('Tabs Demo'),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/sendButton.jpg',
                      height: SizeConfig.blockSizeVertical!*15,
                      width: SizeConfig.blockSizeHorizontal!*30,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.1,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0.0),
                      primary: Color(0xff64DFDF), // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockSizeHorizontal!*10.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Image.asset(
                      'assets/receiveButton.jpg',
                      height: SizeConfig.blockSizeVertical!*15,
                      width: SizeConfig.blockSizeHorizontal!*30,
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.1,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(0.0),
                      primary: Color(0xff64DFDF), // <-- Button color
                      onPrimary: Colors.red, // <-- Splash color
                    ),
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

