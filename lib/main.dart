/*
TODO:
1) Implement basic audio streaming from mic
  - Flutter_sound
    - Check stream format
    - Make simple recording

2) Determine input for audio stream
3) Fix pixel overflow in horizontal view
 */

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

const int tSampleRate = 44000;
typedef _Fn = void Function();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> shading = {
      50: Color.fromRGBO(0, 131, 143, 0.1),
      100: Color.fromRGBO(0, 131, 143, 0.2),
      200: Color.fromRGBO(0, 131, 143, 0.3),
      300: Color.fromRGBO(0, 131, 143, 0.4),
      400: Color.fromRGBO(0, 131, 143, 0.5),
      500: Color.fromRGBO(0, 131, 143, 0.6),
      600: Color.fromRGBO(0, 131, 143, 0.7),
      700: Color.fromRGBO(0, 131, 143, 0.8),
      800: Color.fromRGBO(0, 131, 143, 0.9),
      900: Color.fromRGBO(0, 131, 143, 1.0),
    };
    MaterialColor myColor = MaterialColor(0xFF00838F, shading);
    return MaterialApp(
      title: 'Filler Words',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: myColor,
      ),
      home: MyHomePage(title: 'Filler Words'),
    );
  }
}

class RecordToStreamExample extends StatefulWidget {
  @override
  _RecordToStreamExampleState createState() => _RecordToStreamExampleState();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wordChoice = {
    "umm": false,
    "like": false,
    "yeah": false,
    "you know": false,
    "essentially": false,
    "repeated": false,
  };


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Select the phrases you want monitored",
              style: TextStyle(fontSize: 18,),
            ),
            Divider(),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("Umm"),
                subtitle: Text("Umm, erm, uhh, and ahh"),
                value: wordChoice["umm"],
                onChanged: (bool){
                  setState((){
                    if (wordChoice["umm"] == true){
                      wordChoice["umm"] = false;
                    } else {
                      wordChoice["umm"] = true;
                    }
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("Like"),
                subtitle: Text("Like Kyle"),
                value: wordChoice["like"],
                onChanged: (bool){
                  setState((){
                    if (wordChoice["like"] == true){
                      wordChoice["like"] = false;
                    } else {
                      wordChoice["like"] = true;
                    }
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("So Yeah And"),
                subtitle: Text("Combinations of yeah, and, or so"),
                value: wordChoice["yeah"],
                onChanged: (bool){
                  setState((){
                    if (wordChoice["yeah"] == true){
                      wordChoice["yeah"] = false;
                    } else {
                      wordChoice["yeah"] = true;
                    }
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("You Know"),
                subtitle: Text(""),
                value: wordChoice["you know"],
                onChanged: (bool){
                  setState((){
                    if (wordChoice["you know"] == true){
                      wordChoice["you know"] = false;
                    } else {
                      wordChoice["you know"] = true;
                    }
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("Essentially"),
                subtitle: Text(""),
                value: wordChoice["essentially"],
                onChanged: (bool){
                  setState((){
                    if (wordChoice["essentially"] == true){
                      wordChoice["essentially"] = false;
                    } else {
                      wordChoice["essentially"] = true;
                    }
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("Repeated Words"),
                subtitle: Text("Stuttering and false starts"),
                value: wordChoice["repeated"],
                onChanged: (bool){
                  setState((){
                    if (wordChoice["repeated"] == true){
                      wordChoice["repeated"] = false;
                    } else {
                      wordChoice["repeated"] = true;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordToStreamExampleState extends State<RecordToStreamExample> {
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  String? _mPath;
  StreamSubscription? _mRecordingDataSubscription;

  Future<void> _openRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _mRecorder!.openAudioSession();
    setState(() {
      _mRecorderIsInited = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // Be careful : openAudioSession return a Future.
    // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
    _mPlayer!.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
    _openRecorder();
  }

  @override
  void dispose() {
    stopPlayer();
    _mPlayer!.closeAudioSession();
    _mPlayer = null;

    stopRecorder();
    _mRecorder!.closeAudioSession();
    _mRecorder = null;
    super.dispose();
  }

  Future<IOSink> createFile() async {
    var tempDir = await getTemporaryDirectory();
    _mPath = '${tempDir.path}/flutter_sound_example.pcm';
    var outputFile = File(_mPath!);
    if (outputFile.existsSync()) {
      await outputFile.delete();
    }
    return outputFile.openWrite();
  }

  // ----------------------  Here is the code to record to a Stream ------------

  Future<void> record() async {
    assert(_mRecorderIsInited && _mPlayer!.isStopped);
    var sink = await createFile();
    var recordingDataController = StreamController<Food>();
    _mRecordingDataSubscription =
        recordingDataController.stream.listen((buffer) {
          if (buffer is FoodData) {
            sink.add(buffer.data!);
          }
        });
    await _mRecorder!.startRecorder(
      toStream: recordingDataController.sink,
      codec: Codec.pcm16,
      numChannels: 1,
      sampleRate: tSampleRate,
    );
    setState(() {});
  }
  // --------------------- (it was very simple, wasn't it ?) -------------------

  Future<void> stopRecorder() async {
    await _mRecorder!.stopRecorder();
    if (_mRecordingDataSubscription != null) {
      await _mRecordingDataSubscription!.cancel();
      _mRecordingDataSubscription = null;
    }
    _mplaybackReady = true;
  }

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
      return null;
    }
    return _mRecorder!.isStopped
        ? record
        : () {
      stopRecorder().then((value) => setState(() {}));
    };
  }

  void play() async {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    await _mPlayer!.startPlayer(
        fromURI: _mPath,
        sampleRate: tSampleRate,
        codec: Codec.pcm16,
        numChannels: 1,
        whenFinished: () {
          setState(() {});
        }); // The readability of Dart is very special :-(
    setState(() {});
  }

  Future<void> stopPlayer() async {
    await _mPlayer!.stopPlayer();
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped
        ? play
        : () {
      stopPlayer().then((value) => setState(() {}));
    };
  }

  // ----------------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getRecorderFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(_mRecorder!.isRecording ? 'Stop' : 'Record'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(_mRecorder!.isRecording
                  ? 'Recording in progress'
                  : 'Recorder is stopped'),
            ]),
          ),
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getPlaybackFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(_mPlayer!.isPlaying ? 'Stop' : 'Play'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(_mPlayer!.isPlaying
                  ? 'Playback in progress'
                  : 'Player is stopped'),
            ]),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Record to Stream ex.'),
      ),
      body: makeBody(),
    );
  }
}
