import 'package:flutter/material.dart';
import 'package:ocarina/ocarina.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAudio extends StatelessWidget {

  final player1 = OcarinaPlayer(
    asset: "assets/audios/let_me_love_you.mp3",
    loop: true
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Audio Player"),backgroundColor: Colors.cyan,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x46000000),
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),
                    BoxShadow(
                      color: Color(0x11000000),
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/3552948/pexels-photo-3552948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "Let Me Love You",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Artist: DJ Snake"),
              SizedBox(
                height: 20,
              ),
              // Slider(
              //   onChanged: (v) {},
              //   value: 10,
              //   max: 100,
              //   min: 0,
              //   activeColor: Color(0xFF5E35B1),
              // ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      player1.resume();
                    },
                    icon: Icon(FontAwesomeIcons.pause),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () async{
                      await player1.load();
                      await player1.play();
                    },
                    icon: Icon(
                      Icons.play_arrow,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                  IconButton(
                    onPressed: () async{
                      await player1.pause();
                    },
                    icon: Icon(FontAwesomeIcons.stop),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}