import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    List<Widget> textWidgets = [];

    for (var i=0; i<10; i++){
      var widget = Text('$i');
      textWidgets.add(widget);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("AIML/HACCP"),
      ),
      body: Column(
        children: textWidgets,
      ),
    );
  }
}
