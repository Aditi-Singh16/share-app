import 'package:flutter/material.dart';
import 'package:share_app/screens/home/get-files.dart';
import 'package:share_app/screens/home/get-photos.dart';

import '../../make-responsive.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom:TabBar(
              tabs: [
                Tab(icon: Icon(Icons.image)),
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
                      child:  GetFiles(),
                      ),
                    Icon(Icons.music_note),
                  ],
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('send')
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('receive')
                  )
                ],
              )

            ]
          ),
        ),
      ),
    );
  }
}