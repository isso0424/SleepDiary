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
    return Padding(
        padding: EdgeInsets.all(5),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.sleepInfo.date.month}/${widget.sleepInfo.date.day}",
                style: TextStyle(fontSize: 40),
              ),
              Divider(
                color: Colors.grey,
              ),

              Padding(
                padding: EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              )
            ],
          ),
        ));
  }
}
