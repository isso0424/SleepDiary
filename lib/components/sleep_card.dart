import 'package:flutter/material.dart';
import 'package:sleep_diary/components/sleep_time.dart';
import 'package:sleep_diary/type.dart';

class SleepCard extends StatefulWidget {
  final SleepInfo sleepInfo;

  SleepCard({@required this.sleepInfo});

  _SleepCardState createState() => _SleepCardState();
}

class _SleepCardState extends State<SleepCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("${widget.sleepInfo.date.hour}/${widget.sleepInfo.date.day}"),
          Divider(
            color: Colors.grey,
          ),
          Text("Sleep duration"),
          Divider(
            color: Colors.grey,
          ),
          Row(
            children: [
              SleepTime(
                timeToSleep: widget.sleepInfo.getTimeToSleep(),
              ),
              SleepDuration(
                startTime: widget.sleepInfo.startSleeping,
                finishTime: widget.sleepInfo.finishSleeping,
              )
            ],
          ),
        ],
      ),
    );
  }
}
