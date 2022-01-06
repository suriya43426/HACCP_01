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

  List<Widget> generateText(int count) {
    List<Widget> textWidgets = [];

    for (var i = 0; i < count; i++) {
      
      // ListTile => ListView
      var widget = ListTile(
        title: Text('${i+1}'),
      );
      textWidgets.add(widget);
    }
    return textWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AIML/HACCP"),
        ),
        body: ListView(
          children: generateText(20),
        )
    );
  }
}
