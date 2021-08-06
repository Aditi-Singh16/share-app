import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../make-responsive.dart';

class GetVideos extends StatefulWidget {
  const GetVideos({ Key? key }) : super(key: key);

  @override
  _GetVideosState createState() => _GetVideosState();
}

class _GetVideosState extends State<GetVideos> {




List<Widget> _mediaList = [];
  int currentPage = 0;
  int? lastPage;
  AsciiCodec ac=new AsciiCodec();
  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }
  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }
  _fetchNewMedia() async {
    lastPage = currentPage;
    var result = await PhotoManager.requestPermission();
    if (result) {
      // success
//load the album list
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(onlyAll: true, type: RequestType.video);
      List<AssetEntity> media = await albums[0].getAssetListPaged(currentPage, 60);
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder<Uint8List?>(
            future: asset.thumbData,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData)
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ), 
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 5, bottom: 5),
                        child: Icon(
                          Icons.videocam,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              return Container();
            },
          ),
        );
        
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
      });
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }

  getMyPics(){
    for(int i=0;i<_mediaList.length;i++){
      return _mediaList[i];
    }
  }

  Widget build(BuildContext context) {

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return true;
      },
      child: GridView.custom(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (1 / 1),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          childrenDelegate: SliverChildListDelegate(
              _mediaList.toList()
          )
          ),


    );
  }
}