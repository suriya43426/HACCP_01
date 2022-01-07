import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('COVID19'),
        ),
        body: ListView(
          children: [
            // ListTile Fixed
            ListTile(
              title: Text("ผู้ติดเชื้อสะสม"),
              subtitle: Text("0"),
            ),
            ListTile(
              title: Text("หายแล้ว"),
              subtitle: Text("0"),
            ),
            ListTile(
              title: Text("รักษาในโรงบาล"),
              subtitle: Text("0"),
            ),
            ListTile(
              title: Text("เสียชีวิต"),
              subtitle: Text("0"),
            ),
          ],
        ));
  }
}
