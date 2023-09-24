import 'package:shared_preferences/shared_preferences.dart';

class LocalSource {
  final SharedPreferences preferences;

  LocalSource(this.preferences);

  String loginKey = 'loginClient';
  String clientStartTime = 'startTimeKey';
  String dateTime = 'dateTime';

  ///save client data
  void setClientName({required String name}) {
    preferences.setString(loginKey, name);
  }

  String getClientName() {
    return preferences.getString(loginKey) ?? '';
  }

  bool dataExist() {
    return preferences.containsKey(loginKey);
  }

  void deleteData() {
    preferences.remove(loginKey);
  }

  ///save client start work
  void setStartTime(bool isStart) {
    preferences.setBool(clientStartTime, isStart);
  }

  bool startTime() {
    return preferences.containsKey(clientStartTime);
  }

  void removeStart() {
    preferences.remove(clientStartTime);
  }

  ///save client start time
  void saveDateTime(String date) {
    preferences.setString(dateTime, date);
  }

  String getDateTime() {
    return preferences.getString(dateTime) ?? '';
  }

  deleteDateTime() {
    preferences.remove(dateTime);
  }
}
