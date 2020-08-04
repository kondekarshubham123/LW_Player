import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var LinuxWorld = Text("Linux World",style: TextStyle(fontFamily: "Pacifico", fontSize: 20.0 ),);
    return Scaffold(
      appBar: AppBar(
          title: Text("LW_Player"),
          backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: CircleAvatar(
                  child: LinuxWorld,
                  backgroundColor: Colors.cyan[800],
                ),
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
              ),
              ListTile(
                leading: Icon(Icons.label_important),
                title: Text('Home'),
                onTap: () {
                Navigator.of(context).pushNamed('/');     
                },
              ),
              ListTile(
                leading: Icon(Icons.library_music),
                title: Text('Audio'),
                onTap: () {
                  Navigator.of(context).pushNamed('/audio');       
                },
              ),
              ListTile(
                leading: Icon(Icons.video_library),
                title: Text('Video'),
                onTap: () {
                  Navigator.of(context).pushNamed('/video');   
                },
              ),
            ],
          ),
        ),
        // ----------------------------------------- Drawer ----------------------------------//
        
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 470,
                width: double.infinity,
                color: Colors.blueGrey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),                    
                    Text("Task 1",style: TextStyle(fontFamily: "Pacifico",fontSize: 20),),
                    SizedBox(
                      height: 30,
                    ),
                    Text("* Playing Audio from assets",style: TextStyle(fontSize: 20,)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("* Playing Video from assets",style: TextStyle(fontSize: 20,)),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Library Used",style: TextStyle(fontFamily: "Pacifico",fontSize: 20),),
                    SizedBox(
                      height: 20,
                    ),
                    Text("* video_player: ^0.10.11+2",style: TextStyle(fontSize: 20,)),
                    Text("* ocarina: ^0.0.2",style: TextStyle(fontSize: 20,)),
                  ],
                ),
              ),
              Container(
                height: 90,
                width: double.infinity,
                color: Colors.cyan,
                child: Column(
                  children: <Widget>[
                    // Text("Library Used",style: TextStyle(fontFamily: "Pacifico",fontSize: 20),),
                    Text("Blog and Source code",style: TextStyle(fontFamily: "Pacifico",fontSize: 20),),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.computer), onPressed: null),
            IconButton(icon: Icon(Icons.code), onPressed: null),
          ],
        )
    );
  }
}
