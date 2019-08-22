import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/videoList.dart';
import 'package:flutter_shop/model/videodetail.dart';
import 'package:flutter_shop/pages/index/imagedetail.dart';
import 'package:flutter_shop/services/meinv.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final List<String> previewlist;
  final List<String> imagelist;
  final int currentIndex;
  final List<String> vid;
  final List<String> title;
  final List<String> keyword;

  VideoPlayerScreen(
      {this.previewlist,
      this.imagelist,
      this.currentIndex,
      this.title,
      this.keyword,
      this.vid});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      widget.previewlist[widget.currentIndex],
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.imagelist[widget.currentIndex]);
    return widget.vid[widget.currentIndex] == "0"
        ? ImageDetailWidget(
            currentIndex: widget.currentIndex,
            list: widget.imagelist,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title[widget.currentIndex]),
            ),
            // Use a FutureBuilder to display a loading spinner while waiting for the
            // VideoPlayerController to finish initializing.
            body: Scrollbar(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the VideoPlayerController has finished initialization, use
                      // the data it provides to limit the aspect ratio of the video.
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      // If the VideoPlayerController is still initializing, show a
                      // loading spinner.
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 50.0, left: 120.0),
                        //容器外补白
                        constraints: BoxConstraints.tightFor(
                            width: 200.0, height: 500.0),
                        //卡片大小
                        decoration: BoxDecoration(
                            //背景装饰
                            gradient: RadialGradient(
                                //背景径向渐变
                                colors: [Colors.red, Colors.orange],
                                center: Alignment.topLeft,
                                radius: .98),
                            boxShadow: [
                              //卡片阴影
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 4.0)
                            ]),
                        transform: Matrix4.rotationZ(.2),
                        //卡片倾斜变换
                        alignment: Alignment.center,
                        //卡片内文字居中
                        child: Text(
                          //卡片文字
                          widget.keyword[widget.currentIndex],
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Wrap the play or pause in a call to `setState`. This ensures the
                // correct icon is shown.
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              // Display the correct icon depending on the state of the player.
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
  }
}
