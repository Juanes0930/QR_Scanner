// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  final int id;
  String type;
  final String value;

  ScanModel({
    required this.id,
    required this.type,
    required this.value,
  }) {
    if (type.contains('http')) {
      type = 'http';
    }
    type = 'geo';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json['id'] ?? 'Not found id',
        type: json['type'] ?? 'Not found url',
        value: json['value'] ?? 'not value',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
