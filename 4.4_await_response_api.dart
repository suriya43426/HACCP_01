import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  void initState() {
    // TODO: implement initState
    // for conntect api
    super.initState();
    print("init state");
    getData();
  }

  // ส่ง request => WebAPi => รับ Response
  Future<void> getData() async {
    print("Get Data");
    var url =
        Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
    http.get(url);
    var response = await http.get(url);
    print(response.body);
    return;
  }

  @override
  Widget build(BuildContext context) {
    print("build");

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
