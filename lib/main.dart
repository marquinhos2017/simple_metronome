import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metronome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MetronomePage(),
    );
  }
}

class MetronomePage extends StatefulWidget {
  @override
  _MetronomePageState createState() => _MetronomePageState();
}

class _MetronomePageState extends State<MetronomePage> {
  bool _isPlaying = false;
  double _bpm = 120.0;
  late Timer _timer;
  AudioPlayer _audioCache = AudioPlayer();
  int aux = 0;
  int i = 0;

  Color ball1 = Colors.black;
  Color ball2 = Colors.black;
  Color ball3 = Colors.black;
  Color ball4 = Colors.black;

  bool ball1_ativo = false;
  bool ball2_ativo = false;
  bool ball3_ativo = false;
  bool ball4_ativo = false;

  void _startStopMetronome() {
    if (_isPlaying) {
      _timer.cancel();
    } else {
      _timer = Timer.periodic(Duration(milliseconds: (60000 / _bpm).round()),
          (timer) {
        i += 1;

        print(DateTime.now().second);
        print("i:  $i");
        if (i == 1) {
          setState(() {
            ball1 = Colors.green;

            ball1_ativo = true;
            ball2_ativo = false;
            ball3_ativo = false;
            ball4_ativo = false;
            ball4 = Colors.black;

            ball2 = Colors.black;
            ball3 = Colors.black;
          });
          _audioCache.setVolume(1);
        } else {
          _audioCache.setVolume(0.2);
        }
        if (i == 4) {
          setState(() {
            i = 0;
            ball4 = Colors.green;
            ball1 = Colors.black;
            ball2 = Colors.black;
            ball3 = Colors.black;

            ball1_ativo = false;
            ball2_ativo = false;
            ball3_ativo = false;
            ball4_ativo = true;
          });
        }
        if (i == 2) {
          setState(() {
            ball2 = Colors.green;
            ball4 = Colors.black;
            ball1 = Colors.black;

            ball3 = Colors.black;

            ball1_ativo = false;
            ball2_ativo = true;
            ball3_ativo = false;
            ball4_ativo = false;
          });
        }
        if (i == 3) {
          setState(() {
            ball4 = Colors.black;
            ball1 = Colors.black;
            ball2 = Colors.black;
            ball3 = Colors.green;

            ball1_ativo = false;
            ball2_ativo = false;
            ball3_ativo = true;
            ball4_ativo = false;
          });
        }
        _audioCache.play(AssetSource(
            "metronome_tick.mp3")); // Replace this with your metronome sound file
        _audioCache.stop();
      });
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF2CC8F),
        title: Text(''),
      ),
      body: Container(
        color: Color(0xffF2CC8F),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 158,
                  // color: Colors.orange,
                  child: Text(
                    '${_bpm.toInt()}',
                    style: TextStyle(
                      fontSize: 160,
                      color: Color(0xff3E415B),
                    ),
                  ),
                ),
                Text(
                  "bpm",
                  style: TextStyle(color: Color(0xff3E415B)),
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Container(
                //color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                        mini: true,
                        backgroundColor: Color(0xff3E415B),
                        onPressed: () {
                          setState(() {
                            if (_bpm > 60) {
                              _bpm += -1;
                            }

                            if (_isPlaying) {
                              _timer.cancel();
                              _timer = Timer.periodic(
                                  Duration(
                                      milliseconds: (60000 / _bpm).round()),
                                  (timer) {
                                i += 1;

                                print(DateTime.now().second);
                                print("i:  $i");
                                if (i == 1) {
                                  setState(() {
                                    ball1 = Colors.green;

                                    ball1_ativo = true;
                                    ball2_ativo = false;
                                    ball3_ativo = false;
                                    ball4_ativo = false;
                                    ball4 = Colors.black;

                                    ball2 = Colors.black;
                                    ball3 = Colors.black;
                                  });
                                  _audioCache.setVolume(1);
                                } else {
                                  _audioCache.setVolume(0.2);
                                }
                                if (i == 4) {
                                  setState(() {
                                    i = 0;
                                    ball4 = Colors.green;
                                    ball1 = Colors.black;
                                    ball2 = Colors.black;
                                    ball3 = Colors.black;

                                    ball1_ativo = false;
                                    ball2_ativo = false;
                                    ball3_ativo = false;
                                    ball4_ativo = true;
                                  });
                                }
                                if (i == 2) {
                                  setState(() {
                                    ball2 = Colors.green;
                                    ball4 = Colors.black;
                                    ball1 = Colors.black;

                                    ball3 = Colors.black;

                                    ball1_ativo = false;
                                    ball2_ativo = true;
                                    ball3_ativo = false;
                                    ball4_ativo = false;
                                  });
                                }
                                if (i == 3) {
                                  setState(() {
                                    ball4 = Colors.black;
                                    ball1 = Colors.black;
                                    ball2 = Colors.black;
                                    ball3 = Colors.green;

                                    ball1_ativo = false;
                                    ball2_ativo = false;
                                    ball3_ativo = true;
                                    ball4_ativo = false;
                                  });
                                }
                                _audioCache.play(AssetSource(
                                    "metronome_tick.mp3")); // Replace this with your metronome sound file
                                _audioCache.stop();
                              });
                            }
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: Color(0xffF2CC8F),
                        )),
                    Container(
                      width: 150,
                      child: Slider(
                        activeColor: Color(0xff3E415B),
                        divisions: 180,
                        value: _bpm,
                        min: 60.0,
                        max: 240.0,
                        onChanged: (value) {
                          print("value mudado");
                          setState(() {
                            _bpm = value;
                            if (_isPlaying) {
                              _timer.cancel();
                              _timer = Timer.periodic(
                                  Duration(
                                      milliseconds: (60000 / _bpm).round()),
                                  (timer) {
                                i += 1;
                                print(DateTime.now().second);

                                //print(DateTime.now().second);
                                print("i:  $i");
                                if (i == 1) {
                                  setState(() {
                                    ball1 = Colors.green;

                                    ball1_ativo = true;
                                    ball2_ativo = false;
                                    ball3_ativo = false;
                                    ball4_ativo = false;
                                    ball4 = Colors.black;

                                    ball2 = Colors.black;
                                    ball3 = Colors.black;
                                  });
                                  _audioCache.setVolume(1);
                                } else {
                                  _audioCache.setVolume(0.2);
                                }
                                if (i == 4) {
                                  setState(() {
                                    i = 0;
                                    ball4 = Colors.green;
                                    ball1 = Colors.black;
                                    ball2 = Colors.black;
                                    ball3 = Colors.black;

                                    ball1_ativo = false;
                                    ball2_ativo = false;
                                    ball3_ativo = false;
                                    ball4_ativo = true;
                                  });
                                }
                                if (i == 2) {
                                  setState(() {
                                    ball2 = Colors.green;
                                    ball4 = Colors.black;
                                    ball1 = Colors.black;

                                    ball3 = Colors.black;

                                    ball1_ativo = false;
                                    ball2_ativo = true;
                                    ball3_ativo = false;
                                    ball4_ativo = false;
                                  });
                                }
                                if (i == 3) {
                                  setState(() {
                                    ball4 = Colors.black;
                                    ball1 = Colors.black;
                                    ball2 = Colors.black;
                                    ball3 = Colors.green;

                                    ball1_ativo = false;
                                    ball2_ativo = false;
                                    ball3_ativo = true;
                                    ball4_ativo = false;
                                  });
                                }
                                _audioCache.play(AssetSource(
                                    "metronome_tick.mp3")); // Replace this with your metronome sound file
                                _audioCache.stop();
                              });
                            }
                          });
                        },
                      ),
                    ),
                    FloatingActionButton(
                        mini: true,
                        backgroundColor: Color(0xff3E415B),
                        onPressed: () {
                          setState(() {
                            if (_bpm < 240) {
                              _bpm += 1;
                            }

                            if (_isPlaying) {
                              _timer.cancel();
                              _timer = Timer.periodic(
                                  Duration(
                                      milliseconds: (60000 / _bpm).round()),
                                  (timer) {
                                i += 1;

                                print(DateTime.now().second);
                                print("i:  $i");
                                if (i == 1) {
                                  setState(() {
                                    ball1 = Colors.green;

                                    ball1_ativo = true;
                                    ball2_ativo = false;
                                    ball3_ativo = false;
                                    ball4_ativo = false;
                                    ball4 = Colors.black;

                                    ball2 = Colors.black;
                                    ball3 = Colors.black;
                                  });
                                  _audioCache.setVolume(1);
                                } else {
                                  _audioCache.setVolume(0.2);
                                }
                                if (i == 4) {
                                  setState(() {
                                    i = 0;
                                    ball4 = Colors.green;
                                    ball1 = Colors.black;
                                    ball2 = Colors.black;
                                    ball3 = Colors.black;

                                    ball1_ativo = false;
                                    ball2_ativo = false;
                                    ball3_ativo = false;
                                    ball4_ativo = true;
                                  });
                                }
                                if (i == 2) {
                                  setState(() {
                                    ball2 = Colors.green;
                                    ball4 = Colors.black;
                                    ball1 = Colors.black;

                                    ball3 = Colors.black;

                                    ball1_ativo = false;
                                    ball2_ativo = true;
                                    ball3_ativo = false;
                                    ball4_ativo = false;
                                  });
                                }
                                if (i == 3) {
                                  setState(() {
                                    ball4 = Colors.black;
                                    ball1 = Colors.black;
                                    ball2 = Colors.black;
                                    ball3 = Colors.green;

                                    ball1_ativo = false;
                                    ball2_ativo = false;
                                    ball3_ativo = true;
                                    ball4_ativo = false;
                                  });
                                }
                                _audioCache.play(AssetSource(
                                    "metronome_tick.mp3")); // Replace this with your metronome sound file
                                _audioCache.stop();
                              });
                            }
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Color(0xffF2CC8F),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 60.0),
            Container(
              height: 150,
              width: 150,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Color(0xffE07A5F),
                onPressed: _startStopMetronome,
                tooltip: _isPlaying ? 'Stop' : 'Start',
                child:
                    Icon(_isPlaying ? Icons.stop : Icons.play_arrow, size: 100),
              ),
            ),
            /*       Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 60,
                    height: 60,
                    decoration: ball1_ativo
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(colors: [
                              Color.fromARGB(255, 96, 100, 180)
                                  .withOpacity(0.2),
                              Color.fromARGB(255, 92, 96, 190).withOpacity(0.2),
                            ]), // Adjust the opacity here for the outer container
                          )
                        : null,
                    child: Transform.scale(
                      scale: 0.4,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff989ce1), shape: BoxShape.circle),
                      ),
                    )),
                Container(
                    width: 60,
                    height: 60,
                    decoration: ball2_ativo
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(colors: [
                              Color.fromARGB(255, 96, 100, 180)
                                  .withOpacity(0.2),
                              Color.fromARGB(255, 92, 96, 190).withOpacity(0.2),
                            ]), // Adjust the opacity here for the outer container
                          )
                        : null,
                    child: Transform.scale(
                      scale: 0.4,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff989ce1), shape: BoxShape.circle),
                      ),
                    )),
                Container(
                    width: 60,
                    height: 60,
                    decoration: ball3_ativo
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(colors: [
                              Color.fromARGB(255, 96, 100, 180)
                                  .withOpacity(0.2),
                              Color.fromARGB(255, 92, 96, 190).withOpacity(0.2),
                            ]), // Adjust the opacity here for the outer container
                          )
                        : null,
                    child: Transform.scale(
                      scale: 0.4,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff989ce1), shape: BoxShape.circle),
                      ),
                    )),
                Container(
                    width: 60,
                    height: 60,
                    decoration: ball4_ativo
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(colors: [
                              Color.fromARGB(255, 96, 100, 180)
                                  .withOpacity(0.2),
                              Color.fromARGB(255, 92, 96, 190).withOpacity(0.2),
                            ]), // Adjust the opacity here for the outer container
                          )
                        : null,
                    child: Transform.scale(
                      scale: 0.4,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff989ce1), shape: BoxShape.circle),
                      ),
                    )),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
