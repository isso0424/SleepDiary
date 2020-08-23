class SleepInfo {
  DateTime startSleeping;
  DateTime finishSleeping;
  DateTime date;

  SleepInfo(DateTime startSleeping, DateTime finishSleeping) {
    this.startSleeping = startSleeping;
    this.finishSleeping = this.finishSleeping.isBefore(startSleeping) ?
    finishSleeping.add(new Duration(days: 1)) : finishSleeping;
    this.date = DateTime(
        this.startSleeping.year,
        this.startSleeping.month,
        this.startSleeping.day
    );
  }

  Duration getTimeToSleep() {
    return this.finishSleeping.difference(this.startSleeping);
  }

  SleepInfo.fromJson(Map<String, dynamic> json)
      : startSleeping = DateTime.fromMillisecondsSinceEpoch(json["start"]),
        finishSleeping = DateTime.fromMillisecondsSinceEpoch(json["finish"]),
        date = DateTime.fromMillisecondsSinceEpoch(json["date"]);

  Map<String, dynamic> toJson() => {
    "start": startSleeping.millisecondsSinceEpoch,
    "finish": finishSleeping.millisecondsSinceEpoch,
    "date": finishSleeping.millisecondsSinceEpoch
  };
}