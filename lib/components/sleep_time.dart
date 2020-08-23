import 'package:flutter/material.dart';

class SleepTime extends StatelessWidget {
  final Duration timeToSleep;
  SleepTime({@required this.timeToSleep});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${timeToSleep.inHours}h ${timeToSleep.inMinutes % 60}min",
      style: TextStyle(
        fontSize: 15
      ),
    );
  }
}

class SleepDuration extends StatelessWidget {
  final DateTime startTime;
  final DateTime finishTime;
  SleepDuration({this.startTime, this.finishTime});

  @override
  Widget build(BuildContext context) {
    return Text(
        "${startTime.hour}:${startTime.minute} ~ ${finishTime.hour}:${finishTime.minute}",
        style: TextStyle(
        fontSize: 15
    ),
    );
  }
}
