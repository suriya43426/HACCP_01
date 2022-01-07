import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late CovidTodayResult _dataFromWebAPI;

  @override
  void initState() {

    super.initState();
    print("init state");
    getData();
  }

  // ส่ง request => WebAPi => รับ Response
  Future<void> getData() async {
    print("Get Data");
    var url = Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
    var response = await http.get(url);

    print(response.body);

    setState(() {
      _dataFromWebAPI = covidTodayResultFromJson(response.body) as CovidTodayResult;
    });

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
              title: Text("ผู้ป่วยใหม่"),
              subtitle: Text("${_dataFromWebAPI?.newRecovered}"),
            ),
            ListTile(
              title: Text("หายแล้ว"),
              subtitle: Text("${_dataFromWebAPI?.newRecovered}"),
            ),
            ListTile(
              title: Text("รักษาในโรงบาล"),
              subtitle: Text("${_dataFromWebAPI?.newRecovered}"),
            ),
            ListTile(
              title: Text("เสียชีวิต"),
              subtitle: Text("${_dataFromWebAPI?.newRecovered}"),
            ),
          ],
        ));
  }
}


// path: lib/covid_today_result
// WebAPI response => Json => Format Dart (Tools : quicktype.io)

List<CovidTodayResult> covidTodayResultFromJson(String str) => List<CovidTodayResult>.from(json.decode(str).map((x) => CovidTodayResult.fromJson(x)));

String covidTodayResultToJson(List<CovidTodayResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CovidTodayResult {
  CovidTodayResult({
    this.txnDate,
    this.newCase,
    this.totalCase,
    this.newCaseExcludeabroad,
    this.totalCaseExcludeabroad,
    this.newDeath,
    this.totalDeath,
    this.newRecovered,
    this.totalRecovered,
    this.updateDate,
  });

  DateTime? txnDate;
  int? newCase;
  int? totalCase;
  int? newCaseExcludeabroad;
  int? totalCaseExcludeabroad;
  int? newDeath;
  int? totalDeath;
  int? newRecovered;
  int? totalRecovered;
  DateTime? updateDate;

  factory CovidTodayResult.fromJson(Map<String, dynamic> json) => CovidTodayResult(
    txnDate: DateTime.parse(json["txn_date"]),
    newCase: json["new_case"],
    totalCase: json["total_case"],
    newCaseExcludeabroad: json["new_case_excludeabroad"],
    totalCaseExcludeabroad: json["total_case_excludeabroad"],
    newDeath: json["new_death"],
    totalDeath: json["total_death"],
    newRecovered: json["new_recovered"],
    totalRecovered: json["total_recovered"],
    updateDate: DateTime.parse(json["update_date"]),
  );

  Map<String, dynamic> toJson() => {
    "txn_date": "${txnDate!.year.toString().padLeft(4, '0')}-${txnDate!.month.toString().padLeft(2, '0')}-${txnDate!.day.toString().padLeft(2, '0')}",
    "new_case": newCase,
    "total_case": totalCase,
    "new_case_excludeabroad": newCaseExcludeabroad,
    "total_case_excludeabroad": totalCaseExcludeabroad,
    "new_death": newDeath,
    "total_death": totalDeath,
    "new_recovered": newRecovered,
    "total_recovered": totalRecovered,
    "update_date": updateDate?.toIso8601String(),
  };
}

