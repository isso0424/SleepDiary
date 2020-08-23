import 'package:flutter/material.dart';
import 'package:sleep_diary/components/sleep_card.dart';
import 'package:sleep_diary/data/data.dart';
import 'package:sleep_diary/type.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}): super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Data data;
  _HomePageState() {
    this.data = Data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title
        ),
      ),
      body: FutureBuilder(
        future: data.loadAllDates(),
        builder: (BuildContext context, AsyncSnapshot<List<SleepInfo>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                SleepInfo sleepInfo = snapshot.data[index];
                return SleepCard(sleepInfo: sleepInfo);
              },
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}