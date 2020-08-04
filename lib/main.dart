import 'ui/home.dart';
import 'ui/audio.dart';
import 'ui/video.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LW_Player",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(),
      // initialRoute: '/',
      routes: {
        '/': (_) => HomeScreen(),
        '/audio': (_) => MyAudio(),
        '/video': (_) => VideoPlayerScreen()
      },
    );
  }
}