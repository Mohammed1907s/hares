import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateUtil {
  // TODO get formatted Date
  static String getFormattedDate({required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    // TODO yyyy-MM-dd – kk:mm ->
    // TODO hh => 12
    // TODO kk => 24
    final d = DateFormat('yy-MMM-dd – hh:mm a').format(date);
    return d;
  }

  // TODO get formatted Time
  static String getFormattedTime({required BuildContext context, required String time}) {
    final date = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return TimeOfDay.fromDateTime(date).format(context);
  }

  static String getLastMessageTime({required BuildContext context, required String time}) {
    final sent = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    DateTime now = DateTime.now();

    if (now.day == sent.day &&
        now.month == sent.month &&
        now.year == sent.year) {
      return TimeOfDay.fromDateTime(sent).format(context);
    }

    return '${sent.day} ${_getMonth(sent)}';
  }

  // TODO get formatted last active tome of user in chat screen
  static String getLastActiveTime({required BuildContext context, required String lastActive}) {
    final int iLast = int.tryParse(lastActive) ?? -1;
    if (iLast == -1) return 'last_seen_soon_available'.tr;

    DateTime time = DateTime.fromMillisecondsSinceEpoch(iLast);
    DateTime now = DateTime.now();

    String formattedTime = TimeOfDay.fromDateTime(time).format(context);
    // String formattedTime = DateFormat('hh:mm a').format(time);
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == now.year) {
      return 'last_seen_today_at'.tr + ' ' + formattedTime;
    }

    if ((now.difference(time).inHours / 24).round() == 1) {
      return 'last_seen_yesterday_at'.tr + ' ' + formattedTime;
    }

    String month = _getMonth(time);
    return 'last_seen_on'.tr + ' ' + '${time.day}' + ' ' + month + ' '+ 'on'.tr + ' ' + formattedTime;
  }

  // TODO get formatted
  static String getFormattedDateTime({required String time, String? format, bool? isToday}) {
      String date = '';
      var timeMilliseconds = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
      final today = DateTime.now();
      final yesterday = DateTime.now().add(const Duration(days: -1));

      final minute = DateTime.now().minute;

      final dateTime = DateTime(timeMilliseconds.year, timeMilliseconds.month, timeMilliseconds.day);
      final dateToday = DateTime(today.year, today.month, today.day);
      final dateYesterday = DateTime(yesterday.year, yesterday.month, yesterday.day);
      final timeMinutes = DateTime(today.year, today.month, today.day, today.hour, today.minute, today.second);
      // log('MINUTE: ${DateFormat('hh:mm a').format(timeMinutes)}');

      if (dateTime == dateToday) {
        date = isToday! ? 'today'.tr : DateFormat('hh:mm a').format(timeMilliseconds);
      } else if (dateTime == dateYesterday) {
        date = 'yesterday'.tr;
      } else if (timeMilliseconds.year == today.year) {
        date = DateFormat(format ?? 'MMM-dd').format(timeMilliseconds);
      } else {
        date = DateFormat(format ?? 'yy-MMM-dd').format(timeMilliseconds);
      }

      return date;
  }

  static DateTime getDateTimeFormat(String time) {
    var timeMilliseconds =
        DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return DateTime(
        timeMilliseconds.year, timeMilliseconds.month, timeMilliseconds.day);
  }

  // TODO get month name from month no. or index
  static String _getMonth(DateTime date) {
    switch (date.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'feb'.tr;
      case 3:
        return 'mar'.tr;
      case 4:
        return 'apr'.tr;
      case 5:
        return 'may'.tr;
      case 6:
        return 'jun'.tr;
      case 7:
        return 'jul'.tr;
      case 8:
        return 'aug'.tr;
      case 9:
        return 'sept'.tr;
      case 10:
        return 'oct'.tr;
      case 11:
        return 'nov'.tr;
      case 12:
        return 'dec'.tr;
    }
    return 'NA';
  }
}
