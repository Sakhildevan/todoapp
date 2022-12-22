import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(text)));

  static DateTime toDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date) {
    if (date == null) return null;
    return date.toUtc();
  }

  // static StreamTransformer<QuerySnapshot, List<T>> transformer<T>(
  //   T Function(Map<String, dynamic>) fromJson) =>
  //       StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
  //           handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
  //         final snaps = data.docs.map((doc) => doc.data()).toList();
  //         final objects = snaps.map((json) => fromJson(json)).toList();
  //         sink.add(objects);
  //       });

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
      transformer<T>(T Function(Map<String, dynamic>) fromJson) =>
          StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
                  List<T>>.fromHandlers(
              handleData: (QuerySnapshot<Map<String, dynamic>> data,
                  EventSink<List<T>> sink) {
            final snaps = data.docs.map((doc) => doc.data()).toList();
            final objects = snaps.map((json) => fromJson(json)).toList();
            sink.add(objects);
          });
}
  // static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
  //     transformer<T>(T Function(Map<String, dynamic>) fromJson) =>
  //         StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
  //                 List<T>>.fromHandlers(
  //             handleData: (QuerySnapshot<Map<String, dynamic>> data,
  //                 EventSink<List<T>> sink) {
  //           final snaps = data.docs.map((doc) => doc.data()).toList();
  //           final objects = snaps.map((json) => fromJson(json)).toList();
  //           sink.add(objects);
  //         });

// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Utils {
// static void showSnackBar(BuildContext context, String text) =>
// ScaffoldMessenger.of(context)
// ..removeCurrentSnackBar()
// ..showSnackBar(SnackBar(content: Text(text)));

// static DateTime toDateTime(dynamic value) {
// if (value == null) return DateTime.now();
// return value.toDate();
// }

// static dynamic fromDateTimeToJson(DateTime date) {
// if (date == null) return null;
// return date.toUtc();
// }

// static StreamTransformer<QuerySnapshot, List<T>> transformer<T>(
// T Function(Map<String, dynamic>) fromJson,
// ) =>
// StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
// handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
// final snaps = data.docs.map((doc) => doc.data()).toList();
// final objects = snaps.map((json) => fromJson(json)).toList();
// sink.add(objects);
// },
// );
// }