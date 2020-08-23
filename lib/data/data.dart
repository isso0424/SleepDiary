import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleep_diary/type.dart';

class Data {
  Future<List<SleepInfo>> loadAllDates() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String dates = pref.getString("data");
    if (dates == null) {
      pref.setString("data", json.encode([]));
      return [];
    }

    List<SleepInfo> sleepDates = json.decode(dates);
    return sleepDates;
  }

  Future saveNewData(SleepInfo newData) async {
    List<SleepInfo> beforeData = await loadAllDates();
    beforeData.add(newData);

    String jsonData = json.encode(newData.toJson());

    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("data", jsonData);
  }
}