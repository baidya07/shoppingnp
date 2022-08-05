import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sentry/sentry.dart';

class Helper {
  //this class will hold all the helper methods that will be used through out the app
  static Future<void> sentryCaptureException(dynamic e,
      {dynamic stackTrace}) async {
    //register unexpected exception in sentry console
    await Sentry.captureException(e, stackTrace: stackTrace);
  }

  //toDate : Provided End date from where we need to get duration (end time duration)
  static Duration getDateDifference(String toDate, {DateTime? fromDate}) {
    final date = DateTime.parse(toDate); //parse passed string to datetime
    final fromDet = fromDate ??
        DateTime
            .now(); //if from date passed null duration will be calculated from current time
    return date.difference(fromDet); //return difference
  }

  /// convert a Map into a URL encoded string
  static String encodeMap(Map data) {
    return data.keys
        .map((key) =>
            "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}")
        .join("&");
  }
}

// Get first few words of a String
String getFirstWords(String sentence, int wordCounts) {
  return sentence.split(" ").sublist(0, wordCounts).join(" ");
}

// capitalize the first letter
String capitalizeFirstWord(String text) {
  return (text.toLowerCase()).capitalizeFirstofEach;
}

// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1)}";
//   }
// }

extension CapExtension on String {
  String get inCaps =>
      isNotEmpty ? '${this[0].toUpperCase()}${this.substring(1)}' : '';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");
}


String formatDate({required String dateString}) {
  final now = DateTime.parse(dateString);
  final formatter = DateFormat('yyyy-MM-dd');
  final formatted = formatter.format(now);
  return formatted; // something like 2013-04-20
}
String formatTime({required String dateString}) {
  final now = DateTime.parse(dateString);
  final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  final formatted = formatter.format(now);
  return formatted; // something like 2013-04-20
}
