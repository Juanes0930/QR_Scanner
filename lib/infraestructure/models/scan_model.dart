// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int? id;
  String? type;
  final String value;

  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) 
  {
    if (value.contains('http')) {
      type = 'http';
    }else {
      type = 'geo';
    }
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
