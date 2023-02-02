// To parse this JSON data, do
//
//     final firstModel = firstModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FirstModel firstModelFromJson(String str) => FirstModel.fromJson(json.decode(str));

String firstModelToJson(FirstModel data) => json.encode(data.toJson());

class FirstModel {
  FirstModel({
    required this.requestId,
    required this.items,
    required this.count,
    required this.anyKey,
  });

  String requestId;
  List<Item> items;
  int count;
  String anyKey;

  factory FirstModel.fromJson(Map<String, dynamic> json) => FirstModel(
    requestId: json["requestId"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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

class Item {
  Item({
    required this.createdAt,
    required this.name,
    required this.category,
    required this.lesson,
    required this.id,
  });

  DateTime createdAt;
  String name;
  String category;
  int lesson;
  String id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    createdAt: DateTime.parse(json["createdAt"]),
    name: json["name"],
    category: json["category"],
    lesson: json["lesson"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "name": name,
    "category": category,
    "lesson": lesson,
    "id": id,
  };
}
