import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}
