import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences storage =
    SharedPreferences.getInstance() as SharedPreferences;

class Storage {
  void addData(List<String> q) {
    storage.setStringList('quotes', q);
  }

  void getData() {
    var data = storage.get('quotes');
    print(data);
  }
}
