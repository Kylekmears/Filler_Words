import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

/*
class ToggleTile extends StatefulWidget{
  final bool boolean;

  @override
  _ToggleTile createState() => _ToggleTile(boolean) // WHAT DOES ANY OF THIS DO?
}

class _ToggleTile extends State{

}*/

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

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
  int _counter = 0;
  var wordChoice = {
    "umm": false,
    "like": false,
    "yeah": false,
    "you know": false,
    "essentially": false,
    "repeated": false,
  };
  List<bool> ummList = List.generate(1, (_) => false);
  List<bool> yeahList = List.generate(1, (_) => false);
  List<bool> likeList = List.generate(1, (_) => false);
  // TO DO: MAKE THIS INTO DICTIONARY AND ADD A FXN THAT WILL
  // Reference dict to change state from f to t of vice versa

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
                onChanged: (bool value){
                  setState((){
                    wordChoice["umm"] = wordChoice["umm"] ? false : true;
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("Like"),
                subtitle: Text("Like"),
                value: wordChoice["like"],
                onChanged: (bool value){
                  setState((){
                    wordChoice["like"] = wordChoice["like"] ? false : true;
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
                onChanged: (bool value){
                  setState((){
                    wordChoice["yeah"] = wordChoice["yeah"] ? false : true;
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("You Know"),
                subtitle: Text("You know?"),
                value: wordChoice["you know"],
                onChanged: (bool value){
                  setState((){
                    wordChoice["you know"] = wordChoice["you know"] ? false : true;
                  });
                },
              ),
            ),
            Card(
              child: CheckboxListTile(
                secondary: FlutterLogo(size: 44),
                title: Text("Essentially"),
                subtitle: Text("Essentially"),
                value: wordChoice["essentially"],
                onChanged: (bool value){
                  setState((){
                    wordChoice["essentially"] = wordChoice["essentially"] ? false : true;
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
                onChanged: (bool value){
                  setState((){
                    wordChoice["repeated"] = wordChoice["repeated"] ? false : true;
                  });
                },
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
