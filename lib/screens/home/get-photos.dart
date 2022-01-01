import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../make-responsive.dart';

class GetPhotos extends StatefulWidget {
  const GetPhotos({Key? key}) : super(key: key);

  @override
  _GetPhotosState createState() => _GetPhotosState();
}

class _GetPhotosState extends State<GetPhotos> {

  List<Widget> _mediaList = [];
  List<String> filepath = [];
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

      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(onlyAll: true, type: RequestType.image);
      List<AssetEntity> media = await albums[0].getAssetListPaged(currentPage, 60);
      List<Widget> temp = [];
      for (var asset in media) {
        asset.file.then((value) => {
          filepath.add(value!.path)
        });
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
    bool isChecked = false;
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scroll) {
        _handleScrollEvent(scroll);
        return true;
      },
      child: GridView.builder(
          itemCount: _mediaList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Container(
                  child: _mediaList[index],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Checkbox(
                          value: isChecked,
                          shape: CircleBorder(),
                          onChanged: (value) {
                            print(filepath[index]);
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}