import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _sp;

  static String _name = 'Simon';
  static bool _isDarkMode = false;
  static int _gender = 1;

  static Future init() async {
    _sp = await SharedPreferences.getInstance();
  }

  static String get name => _sp.getString('name') ?? _name;

  static set name ( String name ) {
    _name = name;
    _sp.setString('name', name);
  }
  
  static bool get isDarkMode => _sp.getBool('isDarkMode') ?? _isDarkMode;

  static set isDarkMode( bool val ) {
    _isDarkMode = val;
    _sp.setBool('isDarkMode', val);
  }
  
  static int get gender => _sp.getInt('gender') ?? _gender;

  static set gender( int val ) {
    _gender = val;
    _sp.setInt('gender', val);
  }
}