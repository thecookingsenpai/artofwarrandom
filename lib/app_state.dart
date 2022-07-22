import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _myquotes = prefs.getStringList('ff_myquotes') ?? _myquotes;
  }

  late SharedPreferences prefs;

  String quotechosen = 'Undefined';

  List<String> _myquotes = [];
  List<String> get myquotes => _myquotes;
  set myquotes(List<String> _value) {
    _myquotes = _value;
    prefs.setStringList('ff_myquotes', _value);
  }

  void addToMyquotes(String _value) {
    _myquotes.add(_value);
    prefs.setStringList('ff_myquotes', _myquotes);
  }

  void removeFromMyquotes(String _value) {
    _myquotes.remove(_value);
    prefs.setStringList('ff_myquotes', _myquotes);
  }

  String favstatus = 'Save quote';

  String favquoteselect = '';
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
