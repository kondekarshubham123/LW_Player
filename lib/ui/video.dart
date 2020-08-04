import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';




class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

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
    _controller = VideoPlayerController.asset(
      'assets/videos/Wonders_Of_Nature.mp4',
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),backgroundColor: Colors.cyan,
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Container(
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

            Card(
              color: Colors.cyan,
              margin: EdgeInsets.all(10),
              elevation: 10.0,
              child: Column(
                children: <Widget>[
                  SizedBox(
                  height: 10,
                  ),
            Container(
              // color: Colors.green,
              // height: 60,
              width: double.infinity,
              child: Text("Video Name :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              child: Text("Wonders of Nature"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text("Description: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              child: Text("This is the Original Video of Samsung Galexy S3 !"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text("Duration: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize:15),),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              width: double.infinity,
              child: Text("1 min: 37 sec"),
            ),
            SizedBox(
            height: 10,
            ),


          ],
        ),

            ),



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
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
