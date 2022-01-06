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


    List<Contact> contactList = [
      Contact('Suriya1', '080-443-2496', 'assets/mitrphol.png'),
      Contact('Yasinee', '080-442-2344', 'assets/mitrphol.png'),
      Contact('Suriya1', '080-443-2496', 'assets/mitrphol.png'),
      Contact('Yasinee', '080-442-2344', 'assets/mitrphol.png'),
      Contact('Suriya1', '080-443-2496', 'assets/mitrphol.png'),
      Contact('Yasinee', '080-442-2344', 'assets/mitrphol.png'),
      Contact('Suriya1', '080-443-2496', 'assets/mitrphol.png'),
      Contact('Yasinee', '080-442-2344', 'assets/mitrphol.png'),
      Contact('Suriya1', '080-443-2496', 'assets/mitrphol.png'),
      Contact('Yasinee', '080-442-2344', 'assets/mitrphol.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("AIML/HACCP"),
      ),
      // Constructor Method: Builder, ListView
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {

          Contact contact = contactList[index];

          return ListTile(
            leading: Image.asset(contact.imageSource),
            title: Text(contact.name),
            subtitle: Text(contact.phoneNumber),
          );
        },
      ),
    );
  }
}

class Contact{
  String name;
  String phoneNumber;
  String imageSource;

  // same as Constructor
  Contact(this.name, this.phoneNumber, this.imageSource);
}
