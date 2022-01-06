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

    var contact = Contact('Suriya', '080-441-2495');

    return Scaffold(
      appBar: AppBar(
        title: Text("AIML/HACCP"),
      ),
      // Constructor Method: Builder, ListView
      body: ListView.builder(
        itemCount: 16,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${index+1}'),
          );
        },
      ),
    );
  }
}

class Contact{
  String? name;
  String? phoneNumber;

  // same as Constructor
  Contact(this.name, this.phoneNumber);
}
