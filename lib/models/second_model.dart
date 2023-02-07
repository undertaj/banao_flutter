// To parse this JSON data, do
//
//     final secondModel = secondModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SecondModel secondModelFromJson(String str) => SecondModel.fromJson(json.decode(str));

String secondModelToJson(SecondModel data) => json.encode(data.toJson());

class SecondModel {
  SecondModel({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });

  String requestId;
  List<Item2> items;
  int count;
  String anyKey;

  factory SecondModel.fromJson(Map<String, dynamic> json) => SecondModel(
    requestId: json["requestId"],
    items: List<Item2>.from(json["items"].map((x) => Item2.fromJson(x))),
    count: json["count"],
    anyKey: json["anyKey"],
  );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "count": count,
    "anyKey": anyKey,
  };
}

class Item2 {
  Item2({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  DateTime createdAt;
  String name;
  int duration;
  String category;
  bool locked;
  String id;

  factory Item2.fromJson(Map<String, dynamic> json) => Item2(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    duration: json["duration"],
    category: json["category"],
    locked: json["locked"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "duration": duration,
    "category": category,
    "locked": locked,
    "id": id,
  };
}
