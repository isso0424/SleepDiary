import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:sleep_diary/data/data.dart';
import 'package:sleep_diary/type.dart';

class CreateNewSleepInfoPage extends StatefulWidget {
  final Data data;

  CreateNewSleepInfoPage({this.data});

  _State createState() => _State();
}

class _State extends State<CreateNewSleepInfoPage> {
  DateTime _startSleepingTime;
  DateTime _finishSleepingTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Create new sleep info", style: TextStyle(fontSize: 40),),
          Divider(color: Colors.grey,),
          Row(children: [
          Text("StartTime: ${_startSleepingTime == null ? "Not entered" : _startSleepingTime}", style: TextStyle(fontSize: 20)),
          RaisedButton(
            child: Text("Set"),
            onPressed: () => {
              DatePicker.showTimePicker(context, currentTime: DateTime.now(),
                  onConfirm: (data) {
                DateTime nowDate =
                    DateTime.now().subtract(new Duration(days: 1));
                _startSleepingTime = DateTime(
                  nowDate.year,
                  nowDate.month,
                  nowDate.day,
                  data.hour,
                  data.minute,
                );
                setState(() {
                });
              })
            },
          ),
          ]),
      Row(children: [
          Text("FinishTime: ${_finishSleepingTime == null ? "Not entered" : _finishSleepingTime}", style: TextStyle(fontSize: 20)),
          RaisedButton(
            child: Text("Set"),
            onPressed: () => {
              DatePicker.showTimePicker(context, currentTime: DateTime.now(),
                  onConfirm: (data) {
                DateTime nowDate =
                    DateTime.now().subtract(new Duration(days: 1));
                _finishSleepingTime = DateTime(
                  nowDate.year,
                  nowDate.month,
                  nowDate.day,
                  data.hour,
                  data.minute,
                );
                setState(() {
                });
              })
            },
          ),
          ]),
          RaisedButton(
            child: Text("Create!!!"),
            onPressed: () async {
              if (_startSleepingTime == null || _finishSleepingTime == null) {
                return;
              }

              SleepInfo sleepInfo =
                  SleepInfo(_startSleepingTime, _finishSleepingTime);

              await widget.data.saveNewData(sleepInfo);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
