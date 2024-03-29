import 'package:flutter/material.dart';
import 'package:youtube_dl/state_provider.dart';


class VideoItem extends StatelessWidget {
  final video;
  const VideoItem({Key key, this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => StateProvider.of(context).refreshVideo(video),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Image.network(video.thumbnailPath),
            ),
            Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        video.name,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        video.filePath,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
