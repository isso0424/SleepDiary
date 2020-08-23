import 'package:flutter/material.dart';
import 'package:sleep_diary/components/sleep_card.dart';
import 'package:sleep_diary/data/data.dart';
import 'package:sleep_diary/type.dart';

class HomePage extends StatefulWidget {
  final String title;
  final Data data;
  HomePage({Key key, this.title, this.data}): super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title
        ),
      ),
      body: FutureBuilder(
        future: widget.data.loadAllDates(),
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
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add").then((value) => setState((){}));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}