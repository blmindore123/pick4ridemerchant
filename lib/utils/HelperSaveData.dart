import 'package:shared_preferences/shared_preferences.dart';

class HelperSaveData{

  HelperSaveData._();
  static HelperSaveData helperSaveData = HelperSaveData._();

  SharedPreferences? pref;

  Future<void> initSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> setStringValue(String name, String value) async {
    await pref!.setString(name, value);
  }

  String? getStringValue(String key) {
    return pref!.getString(key);
  }

  Future<void> setIntValue(String key,int value) async {
    await pref!.setInt(key, value);
  }

  int? getIntValue(String value) {
    return pref!.getInt(value);
  }

  Future<void> saveDoubleValue() async {
    await pref!.setDouble("balance", 20.5);
  }

  Future<void> setBoolValue(String key,bool value) async {
    await pref!.setBool(key,value);
  }

  bool? getBoolValue(String value) {
    return pref!.getBool(value);
  }

  Future<void> saveStringListValue(String key,List<String> list) async {
    await pref!.setStringList(key,list);
  }

  List<String>? getStringListValue(String list) {
    return pref!.getStringList(list);
  }

  Future<bool> deleteValue(String key) async {
    return await pref!.remove(key);
  }

  Future<void> logout() async {
    await pref!.clear();
  }
}