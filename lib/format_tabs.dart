import 'package:flutter/material.dart';
import './format_select.dart';

bool filterFormat(str, val) {
  List strParts = str.split("/");
  return strParts[0] == val;
}

class FormatTabs extends StatelessWidget {
  final dynamic videoData;
  final String videoUrl;
  FormatTabs({Key key, this.videoData, this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(videoData);

    final List audioFormats = videoData["formats"]
        .where((item) => filterFormat(item["type"], "audio"))
        .toList();
    final List videoFormats = videoData["formats"]
        .where((item) => filterFormat(item["type"], "video"))
        .toList();
    return Card(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Card(
              child: TabBar(
                tabs: [
                  Tab(
                      icon:
                          Icon(Icons.ondemand_video, color: Colors.deepPurple)),
                  Tab(icon: Icon(Icons.audiotrack, color: Colors.deepPurple)),
                ],
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: TabBarView(
                  children: [
                    FormatSelect(
                      videoName: videoData["title"],
                      thumbnail: videoData["thumbnail"],
                      formatList: videoFormats,
                      videoUrl: videoUrl,
                    ),
                    FormatSelect(
                      videoName: videoData["title"],
                      thumbnail: videoData["thumbnail"],
                      formatList: audioFormats,
                      videoUrl: videoUrl,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
