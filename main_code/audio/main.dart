import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(Task1App());
}

class Task1App extends StatefulWidget {

//CREATING SOME FUNCTIONS FOR PLAYING THE AUDIOS
  @override
  _Task1AppState createState() => _Task1AppState();
}

class _Task1AppState extends State<Task1App> {

//DEFINING FUNCTION AND VARIABLES FOR THE PLAY PAUSE BUTTONS
static AudioPlayer player = new AudioPlayer();
AudioCache music = new AudioCache(fixedPlayer: player);
bool isPlaying = false;
bool stop = true;

//VARIABLES FOR THE ACTION BUTTON
static var action1 = Icon(Icons.youtube_searched_for);
var actionbutton1 = IconButton(icon: action1 , onPressed: null);
var filePath = 'assets/heroestonight.mp3';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('MY MUSIC'),
          backgroundColor: Colors.red,
          leading: Icon(Icons.music_note),
          actions: <Widget>[actionbutton1],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/t5.jpg'),
                  fit: BoxFit.cover
                )
              )
            ),
            Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Card(
                      child: Image.asset('images/t4.jpg'),
                      margin: EdgeInsets.all(20),
                      elevation: 7.0,
                    )
                  ),
                  Container(
                    color: Colors.white,
                    child: ListTile(
                     leading: Icon(Icons.album),
                     title: Text('HEROES TONIGHT'),
                     subtitle: Text('MUSIC BY JANJI'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.white70,
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.red.shade400,
                            shape: CircleBorder()
                          ),
                          child: IconButton(
                            icon: Icon(Icons.play_circle_filled),
                            color: Colors.red,
                            onPressed: () {
                              if (isPlaying == false || stop == true) {
                                music.play('heroestonight.mp3');
                                isPlaying = true;
                                stop = false;
                              }
                            }
                          )
                        )
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.white70,
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.red.shade400,
                            shape: CircleBorder()
                          ),
                          child: IconButton(
                            icon: Icon(Icons.pause_circle_filled),
                            color: Colors.red,
                            onPressed: () {
                              if (isPlaying == true) {
                                player.pause();
                                isPlaying = false;
                              }
                            } 
                          )
                        )
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.white70,
                        child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.red.shade400,
                            shape: CircleBorder()
                          ),
                          child: IconButton(
                            icon: Icon(Icons.stop),
                            color: Colors.red,
                            onPressed: () {
                              if (isPlaying == true && stop == false) {
                                player.stop();
                                isPlaying = false;
                                stop = true;
                              }
                            }
                          )
                        )
                      ),              
                    ]
                  )
                ],
              ),  
          ]  
        )  
      )
    );
  }
}


