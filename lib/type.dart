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
}