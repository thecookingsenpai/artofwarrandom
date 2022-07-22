// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:math';

Future<String?> getFromList(
  List<String> listofdata,
  int index,
) async {
  if (listofdata.isEmpty) {
    return "No quotes found";
  }

  if (index == -1) {
    Random random = Random();
    index = random.nextInt(listofdata.length);
  }

  if (index >= listofdata.length || index < 0) {
    return "No quotes found";
  } else {
    return listofdata.toList()[index];
  }
}
