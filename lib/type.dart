class SleepInfo {
  DateTime startSleeping;
  DateTime finishSleeping;

  SleepInfo(DateTime startSleeping, DateTime finishSleeping) {
    this.startSleeping = startSleeping;
    this.finishSleeping = this.finishSleeping.isBefore(startSleeping) ?
      finishSleeping.add(new Duration(days: 1)) : finishSleeping;
  }

  Duration getTimeToSleep() {
    return this.finishSleeping.difference(this.startSleeping);
  }
}